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

## Model baze podataka

Baza je izrađena u PostgreSQL-u i sastoji se od tablica: `DRZAVA`, `PROIZVODAC`, `DISCIPLINA`, `LOKACIJA`, `SKIJAS`, `UTRKA` i `SKIJAS_UTRKA`.

## Licencija

Ovaj skup podataka je dostupan pod licencijom [Creative Commons Zero v1.0 Universal](LICENSE).
