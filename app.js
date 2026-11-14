const express = require("express");
const { Pool } = require("pg");

const app = express();
const port = 3000;

app.use(express.static(__dirname));

const pool = new Pool({
  user: "postgres",
  password: "bazepodataka",
  host: "localhost",
  port: 5432,
  database: "skijaske_utrke",
});

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.get("/api/pretraga", async (req, res) => {
  const pojam = req.query.att || "";
  const polje = req.query.field || "wildcard";

  const velikiPojam = pojam.toUpperCase();
  const pojamZaUpit = `%${velikiPojam}%`;

  const baseQuery = `
    SELECT 
      u.idutrka, 
      TO_CHAR(u.datum, 'YYYY-MM-DD') AS datum,
      u.spol, 
      l.nazivlokacija, 
      dl.nazivdrzava AS drzavalokacije, 
      d.nazivdisciplina, 
      s.imeskijas, 
      s.prezimeskijas, 
      ds.nazivdrzava AS drzavaskijasa, 
      p.nazivproizvodac AS proizvodacskija, 
      su.vrijeme::text AS vrijeme
    FROM skijas s
    JOIN skijas_utrka su ON s.idskijas = su.idskijas
    JOIN utrka u ON su.idutrka = u.idutrka
    JOIN lokacija l ON u.idlokacija = l.idlokacija
    JOIN drzava dl ON l.iddrzava = dl.iddrzava
    JOIN disciplina d ON u.iddisciplina = d.iddisciplina
    JOIN drzava ds ON s.iddrzava = ds.iddrzava
    JOIN proizvodac p ON s.idproizvodac = p.idproizvodac
  `;

  try {
    let rezultati;

    if (polje === "ime") {
      rezultati = await pool.query(
        `${baseQuery} WHERE UPPER(s.imeskijas) LIKE $1`,
        [pojamZaUpit],
      );
    } else if (polje === "prezime") {
      rezultati = await pool.query(
        `${baseQuery} WHERE UPPER(s.prezimeskijas) LIKE $1`,
        [pojamZaUpit],
      );
    } else {
      rezultati = await pool.query(
        `${baseQuery} WHERE UPPER(s.imeskijas) LIKE $1
                       OR UPPER(s.prezimeskijas) LIKE $1
                       OR UPPER(u.spol) LIKE $1
                       OR UPPER(l.nazivlokacija) LIKE $1
                       OR UPPER(dl.nazivdrzava) LIKE $1
                       OR UPPER(d.nazivdisciplina) LIKE $1
                       OR UPPER(ds.nazivdrzava) LIKE $1
                       OR UPPER(p.nazivproizvodac) LIKE $1
                       OR UPPER(su.vrijeme::text) LIKE $1
                       OR UPPER(TO_CHAR(u.datum, 'YYYY-MM-DD')) LIKE $1
                       OR UPPER(u.idutrka::text) LIKE $1`,
        [pojamZaUpit],
      );
    }

    res.json(rezultati.rows);
  } catch (err) {
    console.error(err);
    res
      .status(500)
      .json({ error: "Greška na poslužitelju prilikom pretrage." });
  }
});

app.listen(port, () => {
  console.log(`Server radi! Slušam na vratima: ${port}`);
});
