document.addEventListener("DOMContentLoaded", () => {
  const searchForm = document.getElementById("searchForm");
  const tableBody =
    document.querySelector("#dataTable tbody") ||
    document.querySelector("table tbody");

  let trenutniPodaci = [];

  function popuniTablicu(podaci) {
    tableBody.innerHTML = "";

    if (podaci.length === 0) {
      tableBody.innerHTML = `<tr><td colspan="11" style="text-align: center;">Nema pronađenih rezultata.</td></tr>`;
      return;
    }

    podaci.forEach((red) => {
      const tr = document.createElement("tr");

      tr.innerHTML = `
        <td>${red.idutrka || red.idUtrka || ""}</td>
        <td>${red.datum || ""}</td>
        <td>${red.spol || ""}</td>
        <td>${red.nazivlokacija || red.nazivLokacija || ""}</td>
        <td>${red.drzavalokacije || red.drzavaLokacije || ""}</td>
        <td>${red.nazivdisciplina || red.nazivDisciplina || ""}</td>
        <td>${red.imeskijas || red.imeSkijas || ""}</td>
        <td>${red.prezimeskijas || red.prezimeSkijas || ""}</td>
        <td>${red.drzavaskijasa || red.drzavaSkijasa || ""}</td>
        <td>${red.proizvodacskija || red.proizvodacSkija || ""}</td>
        <td>${red.vrijeme || ""}</td>
      `;
      tableBody.appendChild(tr);
    });
  }

  async function ucitajPodatke(url) {
    try {
      const response = await fetch(url);
      if (!response.ok) {
        throw new Error("Greška prilikom dohvata podataka s poslužitelja.");
      }
      const data = await response.json();

      trenutniPodaci = data;

      popuniTablicu(data);
    } catch (error) {
      console.error("Došlo je do pogreške:", error);
    }
  }

  ucitajPodatke("/api/pretraga?att=&field=wildcard");

  searchForm.addEventListener("submit", (event) => {
    event.preventDefault();

    const searchValue = document.getElementById("att").value;
    const selectedField = document.getElementById("fieldSelect").value;

    ucitajPodatke(
      `/api/pretraga?att=${encodeURIComponent(searchValue)}&field=${encodeURIComponent(selectedField)}`,
    );
  });

  const downloadJsonBtn = document.getElementById("downloadJsonBtn");
  if (downloadJsonBtn) {
    downloadJsonBtn.addEventListener("click", () => {
      if (trenutniPodaci.length === 0) {
        alert("Nema podataka za preuzimanje!");
        return;
      }

      const jsonString = JSON.stringify(trenutniPodaci, null, 2);
      const blob = new Blob([jsonString], { type: "application/json" });
      const url = URL.createObjectURL(blob);

      const a = document.createElement("a");
      a.href = url;
      a.download = "filtrirane_skijaske_utrke.json";
      a.click();

      URL.revokeObjectURL(url);
    });
  }

  const downloadCsvBtn = document.getElementById("downloadCsvBtn");
  if (downloadCsvBtn) {
    downloadCsvBtn.addEventListener("click", () => {
      if (trenutniPodaci.length === 0) {
        alert("Nema podataka za preuzimanje!");
        return;
      }

      const keys = Object.keys(trenutniPodaci[0]);
      let csvContent = keys.join(",") + "\n";

      trenutniPodaci.forEach((row) => {
        const values = keys.map((key) => {
          let val = row[key] !== null && row[key] !== undefined ? row[key] : "";
          return `"${String(val).replace(/"/g, '""')}"`;
        });
        csvContent += values.join(",") + "\n";
      });

      const blob = new Blob([csvContent], { type: "text/csv;charset=utf-8;" });
      const url = URL.createObjectURL(blob);

      const a = document.createElement("a");
      a.href = url;
      a.download = "filtrirane_skijaske_utrke.csv";
      a.click();

      URL.revokeObjectURL(url);
    });
  }
});
