# Datenbanksysteme (DBMS)

## 1. Was ist ein DBMS?

Ein **Datenbanksystem (DBS)** besteht aus zwei Teilen:

- **Datenbank (DB):** Die gespeicherten Daten selbst  
- **Datenbankmanagementsystem (DBMS):** Die Software, die sich um Speicherung, Ordnung, Zugriff und Sicherheit der Daten kümmert

---

## 2. Wichtige Funktionen eines DBMS

| Funktion                  | Beschreibung |
|---------------------------|--------------|
| **1. Gemeinsame Datenhaltung** | Alle Daten werden zentral gespeichert. Kein Datenchaos, keine Dopplungen. |
| **2. Datenbanksprache (SQL)** | Befehle zum Erstellen, Abfragen, Ändern und Sichern der Daten. |
| **3. Katalog (Data Dictionary)** | Infos über Tabellen, Spalten, Beziehungen usw. |
| **4. Benutzersichten (Views)** | Unterschiedliche Ansichten auf dieselben Daten – je nach Nutzerrolle. |
| **5. Integrität & Konsistenz** | Regeln (Constraints), damit nur gültige Daten gespeichert werden. |
| **6. Zugriffskontrolle** | Genaue Steuerung, wer was sehen und ändern darf. |
| **7. Transaktionen & Mehrbenutzerbetrieb** | Sicheres gleichzeitiges Arbeiten mit Daten (ACID-Prinzip). |
| **8. Datensicherung & Wiederherstellung** | Schutz vor Datenverlust durch Backups und Protokolle. |

---

## 3. Vorteile eines DBMS

- Alles an einem Ort – keine Daten-Doppelungen
- Einfacher Zugriff auf große Datenmengen
- Schneller entwickeln dank Standardbefehlen
- Flexibel anpassbar (Datenmodell unabhängig von Programmlogik)
- Viele Nutzer gleichzeitig möglich
- Weniger Fehler durch klare Regeln und Zugriffsrechte

---

## 4. Nachteile eines DBMS

- Anschaffung & Betrieb können teuer sein
- In Spezialfällen manchmal langsamer
- Man braucht Fachleute zur Betreuung (DBA)
- Komplexe Rechte- und Zugriffssysteme
- Risiko bei Ausfall (außer bei verteilten Systemen)

---

## 5. Wann reicht eine einfache Datei?

- Nur eine Person arbeitet mit den Daten
- Keine Änderungen – nur Lesen
- Echtzeitreaktion extrem wichtig
- Struktur der Daten ist sehr einfach

---

## 6. Welche Datenbanksysteme sind aktuell beliebt?

### Vergleich: Frühere Systeme vs. Top 10 im April 2025

| DBMS              | Hersteller        | In Top 10? |
|-------------------|-------------------|------------|
| **Oracle**         | Oracle            | Ja (1)     |
| **MySQL**          | MySQL AB          | Ja (2)     |
| **MS SQL Server**  | Microsoft         | Ja (3)     |
| **PostgreSQL**     | —                 | Ja (4)     |
| **IBM Db2**        | IBM               | Ja (9)     |
| **MongoDB**        | —                 | Ja         |
| **Snowflake**      | —                 | Ja         |
| **Redis**          | —                 | Ja         |
| **Elasticsearch**  | —                 | Ja         |
| **SQLite**         | —                 | Ja         |
| Adabas, IMS etc.   | Verschiedene      | Nicht mehr unter den Top 10 |

---

## 7. Visualisierung: Top 10 Datenbanksysteme

```plaintext
mindmap
  root((Top 10 DB-Engines))
    MySQL
    Oracle
    PostgreSQL
    SQLite
    Microsoft SQL Server
    Snowflake
    MongoDB
    Redis
    IBM Db2
    Elasticsearch
   
