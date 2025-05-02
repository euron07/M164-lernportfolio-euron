# Normalisierung

## 1. Was ist Datenmodellierung?

Datenmodellierung hilft uns dabei, Informationen so zu strukturieren, dass sie leicht gespeichert und verarbeitet werden können. Es gibt drei Stufen:

- **Konzeptionelles Modell (ERM)**  
  → Zeigt, **was** gespeichert werden soll – unabhängig von der Technik.  
  → Nutzt z. B. Kästchen für Entitäten und Linien für Beziehungen.

- **Logisches Modell (ERD)**  
  → Passt das Modell an ein konkretes Datenbanksystem an (z. B. eine relationale Datenbank).  
  → Enthält Primärschlüssel (PK), Fremdschlüssel (FK) und Datentypen.

- **Physisches Modell**  
  → Ist die technische Umsetzung mit SQL-Befehlen (`CREATE TABLE`, Indizes etc.).  
  → Beinhaltet auch Optimierungen wie Partitionen.

### Datenmodellierung im Data-Warehouse

- **3NF (3. Normalform):** Für saubere, neutrale Datenspeicherung im Kernsystem.  
- **Star Schema:** Für schnelles Reporting – einfach, aber nicht ganz so flexibel.  
- **Data Vault:** Für komplexe Datenflüsse und langfristige Erweiterbarkeit.

---

## 2. Wie funktioniert Normalisierung?

Ziel der Normalisierung: **Redundanzen vermeiden** und **Daten sauber strukturieren**.

### 1. Normalform (1NF)

- Wiederholende Gruppen auflösen  
- Jeder Wert in einer Zelle muss einzeln (atomar) sein

### 2. Normalform (2NF)

- Voraussetzung: 1NF ist erfüllt  
- Keine Abhängigkeiten von nur einem Teil des Primärschlüssels (bei zusammengesetzten Schlüsseln)

### 3. Normalform (3NF)

- Voraussetzung: 2NF ist erfüllt  
- Kein Attribut darf von einem anderen Nicht-Schlüsselattribut abhängen

### Weitere Formen (optional)

- **BCNF, 4NF, 5NF** – für Sonderfälle in sehr komplexen Datenmodellen

