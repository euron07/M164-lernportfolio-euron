-- 1)  Lieferanten mit Sitz in Freiburg  

SELECT
  l.name            AS lieferant,
  o.name            AS ort,
  o.postleitzahl
FROM lieferanten l
JOIN orte       o ON l.orte_orte_id = o.orte_id
WHERE o.name = 'Freiburg';


-- 2)  Verlage mit Sitz in München  

SELECT
  v.name            AS verlag,
  o.name            AS ort
FROM verlage v
JOIN orte    o ON v.orte_orte_id = o.orte_id
WHERE o.name = 'München';


-- 3)  Bücher aus dem Verlag „Assal“  

SELECT
  b.titel,
  b.erscheinungsjahr,
  v.name            AS verlag
FROM buecher  b
JOIN verlage  v ON b.verlage_verlage_id = v.verlage_id
WHERE v.name = 'Assal'
ORDER BY b.erscheinungsjahr DESC;


-- 4)  Bücher des Lieferanten „Schustermann“  

SELECT
  b.titel,
  l.name            AS lieferant
FROM buecher                   b
JOIN buecher_has_lieferanten bl ON b.buecher_id = bl.buecher_buecher_id
JOIN lieferanten              l ON bl.lieferanten_lieferanten_id = l.lieferanten_id
WHERE l.name = 'Schustermann';


-- 5)  Alle Thriller  

SELECT
  b.titel,
  s.bezeichnung      AS sparte
FROM buecher                 b
JOIN buecher_has_sparten    bs ON b.buecher_id = bs.buecher_buecher_id
JOIN sparten                 s ON bs.sparten_sparten_id = s.sparten_id
WHERE s.bezeichnung = 'Thriller'
ORDER BY b.titel;


-- 6)  Alle Liebesromane („Liebe“)  

SELECT
  b.titel,
  s.bezeichnung      AS sparte,
  v.name             AS verlag
FROM buecher                 b
JOIN buecher_has_sparten    bs ON b.buecher_id = bs.buecher_buecher_id
JOIN sparten                 s ON bs.sparten_sparten_id = s.sparten_id
JOIN verlage                 v ON b.verlage_verlage_id = v.verlage_id
WHERE s.bezeichnung = 'Liebe'
ORDER BY b.titel;


-- 7)  Bücher von Sabrina Müller  

SELECT
  a.nachname,
  a.vorname,
  b.titel
FROM autoren               a
JOIN autoren_has_buecher  ab ON a.autoren_id = ab.autoren_autoren_id
JOIN buecher               b ON ab.buecher_buecher_id = b.buecher_id
WHERE a.vorname = 'Sabrina'
  AND a.nachname = 'Müller'
ORDER BY b.titel DESC;


-- 8)  Thriller von Sabrina Müller  

SELECT
  CONCAT(a.vorname,' ',a.nachname)  AS autor,
  b.titel,
  s.bezeichnung                     AS sparte
FROM autoren               a
JOIN autoren_has_buecher  ab ON a.autoren_id = ab.autoren_autoren_id
JOIN buecher               b ON ab.buecher_buecher_id = b.buecher_id
JOIN buecher_has_sparten  bs ON b.buecher_id = bs.buecher_buecher_id
JOIN sparten               s ON bs.sparten_sparten_id = s.sparten_id
WHERE a.vorname = 'Sabrina'
  AND a.nachname = 'Müller'
  AND s.bezeichnung = 'Thriller';


-- 9)  Thriller ODER Humor von Sabrina Müller
SELECT
  CONCAT(a.vorname,' ',a.nachname)  AS autor,
  b.titel,
  GROUP_CONCAT(DISTINCT s.bezeichnung ORDER BY s.bezeichnung SEPARATOR ', ') AS sparten
FROM autoren               a
JOIN autoren_has_buecher  ab ON a.autoren_id = ab.autoren_autoren_id
JOIN buecher               b ON ab.buecher_buecher_id = b.buecher_id
JOIN buecher_has_sparten  bs ON b.buecher_id = bs.buecher_buecher_id
JOIN sparten               s ON bs.sparten_sparten_id = s.sparten_id
WHERE a.vorname = 'Sabrina'
  AND a.nachname = 'Müller'
  AND s.bezeichnung IN ('Thriller','Humor')
GROUP BY b.titel
ORDER BY b.titel;
