# Forward Engineering – ER-Modell in eine echte Datenbank umwandeln

## Was bedeutet "Forward Engineering"?

--> Aus deinem **ER-Diagramm** wird ein **SQL-Skript** erzeugt, mit dem du die Tabellen direkt in einer Datenbank erstellen kannst.

---

## Schritt-für-Schritt-Anleitung

### 1. ER-Modell zeichnen
- Öffne z. B. **MySQL Workbench**
- Erstelle dein **Modell** mit mindestens 3 Tabellen und Beziehungen  
  → z. B. aus dem Projekt „Tourenplaner“

---

### 2. Forward Engineering starten

1. Klicke im Menü auf **Forward Engineer**
2. Wähle die Datenbankverbindung aus (z. B. `localhost` oder Cloud-Server)
3. Gib **Benutzername** und **Passwort** ein
4. Aktiviere diese Optionen:
   - `CREATE TABLE`
   - `FOREIGN KEYS`
   - (Optional: Indizes, Views, Prozeduren)

---

### 3. SQL-Datei speichern

- Klicke auf **"Save to File…"**
- Speichere das Skript unter einem Namen wie `tourenplaner_forward.sql`
- Tipp: Füge das Skript zu deinem Lernportfolio hinzu!

---

### 4. Skript auf Datenbank ausführen

- Klicke auf **"Next"**, um das Skript an den Datenbank-Server zu senden
- Achte darauf, dass keine **Fehlermeldung** erscheint

---

### 5. Kontrolle – Ist alles angekommen?

Führe in MySQL folgende Befehle aus:

```sql
USE AufgabenDB;
SHOW TABLES;
DESCRIBE Tour;
DESCRIBE Teilnehmer;
DESCRIBE Tour_Ort;
