# Select, Having

## 1  Durchschnittsnoten < 4  
```sql
SELECT
    name                     AS Schülername,
    (noteDeutsch + noteMathe) / 2.0 AS Durchschnittsnote
FROM schueler
WHERE (noteDeutsch + noteMathe) / 2.0 < 4;
```

## 2  Durchschnitt (gerundet & sortiert)  
```sql
SELECT
    name                                                AS Schülername,
    ROUND((noteDeutsch + noteMathe) / 2.0, 1)           AS Durchschnittsnote
FROM schueler
HAVING Durchschnittsnote < 4
ORDER BY Durchschnittsnote ASC;
```

## 3  Lehrer mit Nettogehalt > 3000 €  
```sql
SELECT
    name,
    ROUND(gehalt * 0.70, 2) AS Nettogehalt
FROM lehrer
WHERE gehalt * 0.70 > 3000;
```

## 4  Klassenzimmer mit < 10 Schülern  
```sql
SELECT
    klassenzimmer            AS Klassenzimmer,
    COUNT(*)                 AS Anzahl
FROM schueler
GROUP BY klassenzimmer
HAVING COUNT(*) < 10
ORDER BY klassenzimmer;
```

## 5a  Russische Schüler nach Ort  
```sql
SELECT
    o.name          AS `Ort-Name`,
    COUNT(*)        AS Anzahl
FROM schueler AS s
JOIN orte     AS o ON s.idOrte = o.id
WHERE s.nationalitaet = 'RU'
GROUP BY o.id, o.name
ORDER BY o.name;
```

## 5b nur Orte mit ≥ 10 russischen Schülern  
```sql
SELECT
    o.name   AS `Ort-Name`,
    COUNT(*) AS Anzahl
FROM schueler AS s
JOIN orte     AS o ON s.idOrte = o.id
WHERE s.nationalitaet = 'RU'
GROUP BY o.id, o.name
HAVING COUNT(*) >= 10
ORDER BY o.name;
```
