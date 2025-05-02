# Select, Group

## 1  Anzahl aller Schüler nach Nationalität  
*(Spalten: Anzahl, Nationalität)*  
```sql
SELECT
    COUNT(*)      AS Anzahl,
    nationalitaet AS Nationalität
FROM schueler
GROUP BY nationalitaet;
```

## 2  Schüler pro Ort  
*(Spalten: Ort, Anzahl der Schüler – absteigend sortiert)*  
```sql
SELECT
    o.name                         AS Ort,
    COUNT(*)                       AS `Anzahl der Schüler`
FROM schueler AS s
JOIN orte     AS o ON s.idOrte = o.id
GROUP BY o.name
ORDER BY `Anzahl der Schüler` DESC;
```

## 3  Anzahl Lehrer pro Fach  
```sql
SELECT
    f.fachbezeichnung AS Fachbezeichnung,
    COUNT(*)          AS Anzahl
FROM lehrer_hat_faecher AS lf
JOIN faecher           AS f  ON lf.idFaecher = f.id
WHERE lf.idFaecher <> 0   -- Datensatz (0,0) ausschließen
GROUP BY f.id, f.fachbezeichnung
ORDER BY Anzahl DESC;
```

## 4  Lehrerliste pro Fach  
*(eine Zeile pro Fach, sortiert nach Anzahl Lehrer absteigend)*  
```sql
SELECT
    f.fachbezeichnung AS Fachbezeichnung,
    GROUP_CONCAT(DISTINCT l.name ORDER BY l.name SEPARATOR ', ') AS Lehrerliste
FROM lehrer_hat_faecher AS lf
JOIN faecher           AS f  ON lf.idFaecher = f.id
JOIN lehrer            AS l  ON lf.idLehrer  = l.id
WHERE lf.idFaecher <> 0
GROUP BY f.id, f.fachbezeichnung
ORDER BY COUNT(DISTINCT l.id) DESC;
```

## 5  Schüler – zugehörige Lehrer und Fächer  
*(Spalten: Schülername, Lehrer, Fächer)*  
```sql
SELECT
    s.name AS Schülername,
    GROUP_CONCAT(DISTINCT l.name ORDER BY l.name SEPARATOR ', ')      AS Lehrer,
    GROUP_CONCAT(DISTINCT f.fachbezeichnung ORDER BY f.fachbezeichnung SEPARATOR ', ') AS Fächer
FROM schueler             AS s
JOIN lehrer_hat_schueler  AS ls ON s.id = ls.idSchueler
JOIN lehrer               AS l  ON ls.idLehrer = l.id
JOIN lehrer_hat_faecher   AS lf ON l.id        = lf.idLehrer
JOIN faecher              AS f  ON lf.idFaecher = f.id
WHERE lf.idFaecher <> 0
GROUP BY s.id, s.name
ORDER BY s.name;
```
