# Aggregatsfunktionen

## 1 Niedrigstes / höchstes Lehrer-Gehalt
```sql
SELECT 
    MIN(gehalt) AS niedrigstes_gehalt,
    MAX(gehalt) AS hoechstes_gehalt
FROM lehrer;
```

## 2 Niedrigstes Gehalt eines Mathe-Lehrers
```sql
SELECT 
    MIN(l.gehalt) AS niedrigstes_mathe_gehalt
FROM lehrer             AS l
JOIN lehrer_hat_faecher AS lf ON l.id = lf.idLehrer
JOIN faecher            AS f  ON lf.idFaecher = f.id
WHERE f.fachbezeichnung = 'Mathe';
```

## 3 Bester Ø aus Deutsch & Mathe  
*(wenn **1** beste Note ⇒ MIN, wenn **6** beste --> MAX nutzen)*
```sql
-- Variante „1 ist beste Note“
SELECT MIN((noteDeutsch + noteMathe) / 2) AS bester_durchschnitt
FROM schueler;

-- Variante „6 ist beste Note“
SELECT MAX((noteDeutsch + noteMathe) / 2) AS bester_durchschnitt
FROM schueler;
```

## 4 Höchste / niedrigste Einwohnerzahl eines Ortes
```sql
SELECT
    MAX(einwohnerzahl) AS hoechste_einwohnerzahl,
    MIN(einwohnerzahl) AS niedrigste_einwohnerzahl
FROM orte;
```

## 5 Differenz zwischen größtem und kleinstem Ort
```sql
SELECT
    MAX(einwohnerzahl) - MIN(einwohnerzahl) AS differenz
FROM orte;
```

## 6 Gesamtzahl Schüler
```sql
SELECT COUNT(*) AS anzahl_schueler
FROM schueler;
```

## 7 Schüler **mit** Smartphone
```sql
SELECT COUNT(*) AS schueler_mit_smartphone
FROM schueler
WHERE idSmartphones IS NOT NULL;
```

## 8 Schüler mit Smartphone **Samsung** oder **HTC**
```sql
SELECT COUNT(*) AS samsung_oder_htc
FROM schueler  AS s
JOIN smartphones AS sp ON s.idSmartphones = sp.id
WHERE sp.marke IN ('Samsung','HTC');
```

## 9 Schüler, die in **Waldkirch** wohnen
```sql
SELECT COUNT(*) AS schueler_in_waldkirch
FROM schueler AS s
JOIN orte     AS o ON s.idOrte = o.id
WHERE o.name = 'Waldkirch';
```

## 10 Schüler bei **Herrn Bohnert** aus **Emmendingen**
```sql
SELECT COUNT(*) AS schueler_bohnert_emmendingen
FROM schueler            AS s
JOIN lehrer_hat_schueler AS ls ON s.id = ls.idSchueler
JOIN lehrer              AS l  ON ls.idLehrer = l.id
JOIN orte                AS o  ON s.idOrte    = o.id
WHERE l.name = 'Bohnert'
  AND o.name = 'Emmendingen';
```

## 11 Schüler-Anzahl von **Frau Zelawat**
```sql
SELECT COUNT(DISTINCT ls.idSchueler) AS schueler_zelawat
FROM lehrer_hat_schueler AS ls
JOIN lehrer              AS l ON ls.idLehrer = l.id
WHERE l.name = 'Zelawat';
```

## 12 Russische Schüler bei Frau Zelawat
```sql
SELECT COUNT(DISTINCT s.id) AS russisch_zelawat
FROM schueler            AS s
JOIN lehrer_hat_schueler AS ls ON s.id = ls.idSchueler
JOIN lehrer              AS l  ON ls.idLehrer = l.id
WHERE l.name = 'Zelawat'
  AND s.nationalitaet = 'RU';
```

## 13 Lehrer mit höchstem Gehalt  
```sql
SELECT name, gehalt
FROM lehrer
WHERE gehalt = (SELECT MAX(gehalt) FROM lehrer);
```
