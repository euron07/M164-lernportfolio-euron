-- a) Alle Datensätze der DVD-Sammlung ausgeben
SELECT *
FROM dvd_sammlung;

-- b) Filmtitel und zugehörige Nummer ausgeben
SELECT film, nummer
FROM dvd_sammlung;

-- c) Filmtitel und zugehörigen Regisseur ausgeben
SELECT film, regisseur
FROM dvd_sammlung;

-- d) Liste aller Filme von Quentin Tarantino
SELECT *
FROM dvd_sammlung
WHERE regisseur = 'Quentin Tarantino';

-- e) Liste aller Filme von Steven Spielberg
SELECT *
FROM dvd_sammlung
WHERE regisseur = 'Steven Spielberg';

-- f) Liste aller Filme, in denen der Regisseur den Vornamen "Steven" hat
SELECT *
FROM dvd_sammlung
WHERE regisseur LIKE 'Steven %';

-- g) Liste aller Filme, die länger als 2 Stunden sind (120 Minuten)
SELECT *
FROM dvd_sammlung
WHERE laenge_minuten > 120;

-- h) Liste aller Filme, die von Tarantino oder Spielberg gedreht wurden
SELECT *
FROM dvd_sammlung
WHERE regisseur IN ('Quentin Tarantino', 'Steven Spielberg');

-- i) Filme von Tarantino, die kürzer als 90 Minuten sind
SELECT *
FROM dvd_sammlung
WHERE regisseur = 'Quentin Tarantino'
  AND laenge_minuten < 90;

-- j) Film suchen, in dessen Titel "Sibirien" vorkommt
SELECT *
FROM dvd_sammlung
WHERE film LIKE '%Sibirien%';

-- k) Alle Teile von "Das grosse Rennen" ausgeben
SELECT *
FROM dvd_sammlung
WHERE film LIKE 'Das grosse Rennen%';

-- l) Alle Filme sortiert nach Regisseur
SELECT *
FROM dvd_sammlung
ORDER BY regisseur;

-- m) Alle Filme sortiert nach Regisseur, dann nach Filmtitel
SELECT *
FROM dvd_sammlung
ORDER BY regisseur, film;

-- n) Alle Filme von Tarantino, die längsten zuerst
SELECT *
FROM dvd_sammlung
WHERE regisseur = 'Quentin Tarantino'
ORDER BY laenge_minuten DESC;
