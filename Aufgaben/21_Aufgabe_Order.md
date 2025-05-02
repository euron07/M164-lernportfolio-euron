# Order

## 1  Schafe im Jahr 2018 (absteigend nach Gebiet)
```sql
SELECT *
FROM   nutztiere
WHERE  tierart LIKE 'Schafe%'   -- nur Schafe
  AND  jahr = 2018              -- Jahr 2018
ORDER BY gebiet_name DESC;
```

## 2  Gesamtzahl Schafe im Jahr 2018
```sql
SELECT SUM(anzahl) AS total_schafe_2018
FROM   nutztiere
WHERE  tierart LIKE 'Schafe%'
  AND  jahr = 2018;
```

## 3  Durchschnittliche Kühe in **Region Zürich** (alle Jahre)
```sql
SELECT AVG(anzahl) AS avg_kuehe_zuerich
FROM   nutztiere
WHERE  tierart LIKE 'Kühe%'
  AND  gebiet_name = 'Region Zürich';
```

## 4  Höchste Kühe-Anzahl in **Region Zürich**
```sql
SELECT MAX(anzahl) AS max_kuehe_zuerich
FROM   nutztiere
WHERE  tierart LIKE 'Kühe%'
  AND  gebiet_name = 'Region Zürich';
```

## 5  Niedrigste Kühe-Anzahl in **Region Zürich**
```sql
SELECT MIN(anzahl) AS min_kuehe_zuerich
FROM   nutztiere
WHERE  tierart LIKE 'Kühe%'
  AND  gebiet_name = 'Region Zürich';
```

## 6  Totale Nutztiere pro Region im Jahr 2016
```sql
SELECT
    gebiet_name,
    SUM(anzahl) AS total_2016
FROM   nutztiere
WHERE  jahr = 2016
GROUP BY gebiet_name
ORDER BY total_2016 DESC;
```

## 7  Totale Nutztiere **pro Region & Jahr**
```sql
SELECT
    gebiet_name,
    jahr,
    SUM(anzahl) AS total_nutztiere
FROM   nutztiere
GROUP BY gebiet_name, jahr
ORDER BY gebiet_name, jahr;
```

## 8  Totale Nutztiere pro Region & Jahr (nach Jahr sortiert)
```sql
SELECT
    gebiet_name,
    jahr,
    SUM(anzahl) AS total_nutztiere
FROM   nutztiere
GROUP BY gebiet_name, jahr
ORDER BY jahr, gebiet_name;
```

## 9  Totale Nutztiere pro Region & Jahr **ab 2015** (nach Jahr sortiert)
```sql
SELECT
    gebiet_name,
    jahr,
    SUM(anzahl) AS total_nutztiere
FROM   nutztiere
WHERE  jahr >= 2015
GROUP BY gebiet_name, jahr
ORDER BY jahr, gebiet_name;
```
