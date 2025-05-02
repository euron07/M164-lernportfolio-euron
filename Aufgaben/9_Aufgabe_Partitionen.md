# Partitionierung, Speicher-Engine & Tablespace

## 1. Was ist Partitionierung?

**Partitionierung** bedeutet: Eine große Tabelle wird in kleinere Teile aufgeteilt, um sie besser zu verwalten und schneller abzufragen.

### Arten der Partitionierung:

- **Horizontale Partitionierung:**  
  Datenzeilen werden z. B. nach Jahr, Land oder Abteilung aufgeteilt.  
  *Beispiel:* Alle Rechnungen aus 2024 in einer Partition, 2025 in einer anderen.

- **Vertikale Partitionierung:**  
  Spalten einer Tabelle werden getrennt gespeichert.  
  *Beispiel:* Stammdaten (Name, Adresse) in einer Tabelle, andere Infos (z. B. Passwort, Loginzeit) in einer anderen.

### Vorteile:
- Schnellere Abfragen bei großen Datenmengen  
- Bessere Verteilung der Last auf mehrere Server  
- Einfacheres Datenmanagement

---

## 2. Was ist eine Storage Engine?

Eine **Storage Engine** ist das "Innenleben" einer Datenbank – sie kümmert sich darum, wie Daten wirklich gespeichert, gelesen und verändert werden.

### Beispiele in MySQL:

| Engine     | Eigenschaften                                                                 |
|------------|-------------------------------------------------------------------------------|
| **InnoDB** | Unterstützt Transaktionen, Foreign Keys, sichert Daten bei Abstürzen         |
| **MyISAM** | Schneller bei nur Lesen, aber keine Transaktionen oder Beziehungen möglich   |
| **Memory** | Speichert Daten im Arbeitsspeicher, ist superschnell – aber beim Neustart weg |

---

## 3. Was ist ein Tablespace (bei InnoDB)?

Ein **Tablespace** ist ein Speicherbereich, in dem MySQL Tabellen und deren Daten organisiert.

### Arten:

- **System Tablespace:**  
  Gemeinsamer Speicherort für mehrere Tabellen (z. B. `ibdata1`)

- **File-per-Table Tablespace:**  
  Jede Tabelle bekommt ihre eigene Datei (z. B. `kunde.ibd`)  
  *Vorteil:* Einzelne Tabellen lassen sich einfacher sichern oder verschieben

---

**Zusammengefasst:**  
Mit Partitionierung teilst du große Tabellen clever auf.  
Mit Storage Engines wählst du, wie die Daten intern verarbeitet werden.  
Mit Tablespaces entscheidest du, wo und wie die Daten gespeichert sind.
