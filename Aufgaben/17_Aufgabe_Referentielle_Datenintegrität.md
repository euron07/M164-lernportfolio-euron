# Tourenplaner – Referentielle Datenintegrität  
## Aufgabe 1 – Warum kann man Datensätze nicht einfach löschen?

**Was passiert, wenn man einen verbundenen Datensatz löscht?**  
Es entstehen **verwaiste Daten** – in anderen Tabellen bleiben falsche Verweise übrig. Dadurch wird die Datenbank unzuverlässig und Abfragen liefern falsche Ergebnisse.

**Wer sorgt dafür, dass das nicht passiert?**  
Das **Datenbank-System** selbst. Jede **Fremdschlüssel-Bedingung** sorgt dafür, dass beim Hinzufügen, Ändern oder Löschen von Daten die **Datenintegrität** gewahrt bleibt und bricht den Vorgang ab, wenn ein Fehler passiert.

---

## Aufgabe 2 – „4000 Basel“ durch „3000 Bern“ ersetzen

### 2.1 Was passiert beim direkten Löschen?

~~~sql
DELETE FROM tbl_orte
WHERE PLZ = '4000' AND Ortsbezeichnung = 'Basel';
/*  Error 1451: Cannot delete or update a parent row:
    a foreign key constraint fails
    (tourenplaner.tbl_stationen …
     FOREIGN KEY (FS_ID_Ort) REFERENCES tbl_orte (ID_Ort))           */
~~~

`tbl_stationen` (und evtl. weitere Tabellen) verweisen mit `FS_ID_Ort = 5` auf diesen Datensatz.  
MySQL lässt das Löschen wegen **ON DELETE RESTRICT** nicht zu.

---

### 2.2 Variante 1 (empfohlen) – Datensatz *aktualisieren*

~~~sql
UPDATE tbl_orte
SET    PLZ             = '3000',
       Ortsbezeichnung = 'Bern'
WHERE  ID_Ort = 5;        -- 5 = bisher „4000 Basel“
~~~

Alle Fremdschlüssel behalten dieselbe `ID_Ort`; damit ist sofort überall „3000 Bern“ hinterlegt.

---

### 2.3 Variante 2 – Neuen Ort anlegen, Verweise umhängen, alten Ort löschen  

*(alles in **einer Transaktion** ausführen)*

~~~sql
START TRANSACTION;

-- 1) neuen Ort anlegen
INSERT INTO tbl_orte (PLZ, Ortsbezeichnung)
VALUES ('3000', 'Bern');
SET @idBern = LAST_INSERT_ID();

-- 2) Fremdschlüssel auf neue ID umstellen
UPDATE tbl_stationen
SET    FS_ID_Ort = @idBern
WHERE  FS_ID_Ort = 5;

-- ggf. weitere Tabellen mit FK auf tbl_orte ebenfalls updaten …

-- 3) alten Ort löschen
DELETE FROM tbl_orte
WHERE  ID_Ort = 5;

COMMIT;
~~~

---

### 2.4 Warum **nicht** einfach `ON DELETE CASCADE`?

Bei `CASCADE` würde das Löschen von „Basel“ **alle zugehörigen Stationen** entfernen – in der Regel unerwünscht.  
Darum nutzt man hier bewusst `RESTRICT | NO ACTION`.

---
