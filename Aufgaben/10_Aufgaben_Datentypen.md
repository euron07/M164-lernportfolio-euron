# Wichtige Datentypen in MariaDB (MySQL)

| **Kategorie**                | **Datentyp**                  | **Beispiel**                       | **Erläuterung** |
|-----------------------------|-------------------------------|------------------------------------|-----------------|
| Ganze Zahlen                | `TINYINT`, `SMALLINT`, `INT`, `BIGINT` | `INT` → 25                        | Für ganze Zahlen, z. B. Alter, Anzahl. `INT` reicht oft aus. |
| Natürliche Zahlen (≥0)      | z. B. `INT UNSIGNED`           | `INT UNSIGNED` → 42                | Nur positive Werte, z. B. für IDs. Kein Minus möglich. |
| Dezimalzahlen (genau)       | `DECIMAL(M,D)`                | `DECIMAL(10,2)` → 12345.67         | Genau für Geldbeträge. M = Gesamtstellen, D = Nachkommastellen. |
| Kommazahlen (ungefähr)      | `FLOAT`, `DOUBLE`             | `FLOAT` → 3.14                     | Für Messwerte, z. B. Temperatur – aber leichte Rundungsfehler möglich. |
| Wahr/Falsch (Boolean)       | `BOOLEAN`                     | `BOOLEAN` → TRUE                   | Ja/Nein-Werte. Intern ist TRUE=1, FALSE=0. |
| Einzelnes Zeichen           | `CHAR(1)`                     | `CHAR(1)` → 'A'                    | Genau ein Buchstabe oder Zeichen. |
| Fester Text                 | `CHAR(n)`                     | `CHAR(10)` → 'Beispiel  '         | Immer exakt n Zeichen (mit Leerzeichen aufgefüllt). |
| Variabler Text              | `VARCHAR(n)`, `TEXT`          | `VARCHAR(100)` → 'Hallo Welt'     | Länge passt sich an. Für Namen, Kommentare etc. |
| Mehrzeiliger Text           | `TEXT`, `TINYTEXT`, …         | `TEXT`                             | Sehr lange Texte, z. B. Beschreibung, Notizen. |
| Datum/Zeit                  | `DATE`, `TIME`, `DATETIME`    | `DATE` → '2025-05-02'             | Speichert Kalenderdaten und/oder Uhrzeit. |
| Zeitstempel                 | `TIMESTAMP`                   | `TIMESTAMP DEFAULT NOW()`         | Aktuelles Datum+Zeit, oft automatisch gesetzt. |
| Binäre Daten (Dateien)      | `BLOB`, `VARBINARY(n)`        | `BLOB` → Bild, PDF                 | Für Dateien, Bilder, Musik etc. |
| Auswahlliste (ENUM)         | `ENUM('rot','grün','blau')`   | `'grün'`                           | Wert muss aus festgelegter Liste stammen. |
| Strukturierte Daten         | `JSON`                        | `JSON` → `{"name": "Ali"}`        | Speichert komplexe Objekte oder Listen. |

 **Hinweis:** Komplexe zusammengesetzte Datentypen (wie `Structs` in anderen Sprachen) werden in SQL meist durch mehrere Spalten oder per `JSON` umgesetzt.
