# or-labosi

Labosi iz predmeta Otvoreno računarstvo

# Skijaške utrke Svjetskog kupa (Sezona 2026/2027)

Ovaj repozitorij sadrži otvoreni skup podataka o utrkama Svjetskog kupa u alpskom skijanju u sezoni 2026/27. Kreiran je u svrhu laboratorijskih vježbi iz predmeta Otvoreno Računarstvo na FER-u.

## Opis skupa podataka

Podaci prate:

- Skijaše i skijašice te državu za koju se natječu i proizvođača skija kojeg imaju
- Popis svih utrka u sezoni 2026/27 (gdje, kad, u kojoj državi i u kojoj disciplini)
- Rezultate skijaša na utrkama

## Struktura repozitorija

- `skijaske_utrke.csv` - CSV datoteka s podacima
- `skijaske_utrke.json` - JSON datoteka s podacima
- `baza_dump.sql` - Dump baze podataka
- `index.html` - stranica koja sadrži linkove za download i poveznicu na datatable.html
- `datatable.html` - stranica za pretraživanje podataka
- `style.css` - CSS datoteka za stilsko uređenje stranice
- `script.js` - frontend JavaScript skripta
- `app.js` - backend JavaScript skripta koja komunicira s bazom podataka
- `schema.json` - JSON Schema Datoteka

## Model baze podataka

Baza je izrađena u PostgreSQL-u i sastoji se od tablica: `DRZAVA`, `PROIZVODAC`, `DISCIPLINA`, `LOKACIJA`, `SKIJAS`, `UTRKA` i `SKIJAS_UTRKA`.

- Relacija DRZAVA sadrži primarni ključ koji predstavlja id države (Integer) te naziv države (String)
- Relacija PROIZVODAC sadrži primarni ključ koji predstavlja id Proizvođača skija (Integer) te naziv proizvođača skija (String)
- Relacija DISCIPLINA sadrži primarni ključ koji predstavlja id Discipline (Integer) te naziv Discipline (String)
- Relacija LOKACIJA sadrži primarni ključ koji predstavlja id Lokacije koja je ujedno i mjesto gdje se održava neka utrka (Integer), naziv te lokacije (String) te strani ključ id države koji označava gdje se ta lokacija nalazi (Integer)
- Relacija SKIJAS sadrži primarni ključ koji predstavlja id skijaša/ice (Integer), ime i prezime skijaša/ice (String) te dva strana ključa id države za koju se natječe (Integer) i id proizvođača skija (Integer)
- Relacija UTRKA sadrži primarni ključ koji predstavlja id utrke (Integer) te spol utrke "M" ili "Ž" (String), datum utrke (Date) te strane ključeve id lokacije (Integer) i id disciplina (Integer)
- Relacija SKIJAS_UTRKA sadrži skup primarnih ključeva, koji su strani ključevi, id utrke (Integer) i id skijaša/ice (Integer) te njihovo vrijeme na pojedinoj utrci (Interval)

## Licencija

Ovaj skup podataka je dostupan pod licencijom [Creative Commons Zero v1.0 Universal](LICENSE).
