# Modell mit der Datenbank abgleichen (Synchronize Model)

## 1. Modell ändern

- Öffne dein **ER-Diagramm** im Modellierungstool (z. B. MySQL Workbench)
- Füge eine neue Tabelle hinzu, z. B. `Benutzer` (für Login-Daten)
- Verbinde `Benutzer` mit einer vorhandenen Tabelle, z. B. `Buchung`
- Ergänze in einer bestehenden Tabelle (z. B. `Buchung`) ein neues Feld, z. B. `Kommentar VARCHAR(200)`

---

## 2. Änderungen mit der Datenbank synchronisieren

1. Rechtsklick auf das Datenbankschema → **"Edit Schema"** (wenn nötig, Namen anpassen)
2. Öffne im Menü: **Database → Synchronize Model…**
3. Wähle die Verbindung zu deiner Datenbank (z. B. `localhost`, `tbz-cloud`, oder `AWS`)
4. Der Assistent zeigt dir die Unterschiede zwischen deinem Modell und der echten Datenbank
5. Übernehme die vorgeschlagenen Änderungen direkt oder speichere sie als SQL-Datei

---

## 3. Ergebnis kontrollieren

Nutze diese SQL-Befehle, um zu prüfen, ob alles geklappt hat:

```sql
USE AufgabenDB;
SHOW TABLES LIKE 'Benutzer';
DESCRIBE Buchung;
