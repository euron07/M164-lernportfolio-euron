# WHERE vs HAVING

## Durchschnitt der Mathe-Noten  
Schüler, deren Name mit **B** beginnt und deren Mathe-Note < 3.  

```sql
SELECT
    AVG(s.noteMathe) AS `Durchschnitt Mathe`
FROM schueler AS s
WHERE s.name      LIKE 'B%'
  AND s.noteMathe < 3;

SELECT
    sp.marke,
    COUNT(*) AS anzahl
FROM schueler    AS s
JOIN smartphones AS sp ON sp.id = s.idSmartphones
WHERE sp.marke <> 'Apple'
GROUP BY sp.id, sp.marke
HAVING COUNT(*) >= 15;

SELECT
    l.status,
    COUNT(*) AS anzahl
FROM lehrer AS l
WHERE l.idOrte = 4
  AND l.gehalt  > 2000
GROUP BY l.status;

SELECT
    f.fachbezeichnung,
    COUNT(l.id)   AS anzahlLehrer,
    AVG(l.gehalt) AS durchschnittsgehalt
FROM lehrer_hat_faecher AS lhf
JOIN lehrer            AS l ON l.id = lhf.idLehrer
JOIN faecher           AS f ON f.id = lhf.idFaecher
WHERE f.fachbezeichnung LIKE 'R%'
   OR f.fachbezeichnung LIKE 'M%'
GROUP BY f.id, f.fachbezeichnung
HAVING AVG(l.gehalt) > 2800;
```
