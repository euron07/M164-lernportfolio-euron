# Beziehungsarten

## 1. Zusammenfassung Datenmodellierung

- **Zweck:** Strukturierung der zu verarbeitenden und zu speichernden Daten in Informationssystemen  
- **Phasen der Datenmodellierung:**  
  - **Konzeptionelles Datenmodell (ERM):**  
    - Fachliche Abbildung der Anforderungen  
    - Implementierungs‐unabhängig  
  - **Logisches Datenmodell (ERD):**  
    - Abbildung auf das Ziel‐Datenbanksystem (z. B. relational)  
    - Definition von Primärschlüsseln (PK), Fremdschlüsseln (FK) und Datentypen  
  - **Physisches Datenmodell:**  
    - DDL-Skripte (CREATE TABLE, …)  
    - Indizes, Partitionierung, produktspezifische Optimierungen  

- **Modellierungstypen im Data-Warehouse-Umfeld:**  
  - **3NF-Modellierung:** Operative Systeme, Core/Enterprise DWH, anwendungsneutrale Speicherung  
  - **Star Schema:** Reporting-Layer/Data-Mart, optimiert für Auswertungen  
  - **Data Vault:** Core-DWH/Integration-Layer, Fokus auf Erweiterbarkeit und automatisierte Ladung  

---

## 2. Normalisierungsschritte

1. **1. Normalform (1NF)**  
   - Entfernen mehrfach auftretender Gruppen  
   - Alle Attribute haben atomare (unteilbare) Werte  

2. **2. Normalform (2NF)**  
   - Voraussetzung: 1NF erfüllt  
   - Keine partiellen Abhängigkeiten bei zusammengesetztem Primärschlüssel  

3. **3. Normalform (3NF)**  
   - Voraussetzung: 2NF erfüllt  
   - Keine transitiven Abhängigkeiten (kein Nicht-Schlüsselattribut von einem anderen Nicht-Schlüsselattribut abhängig)  

4. **Weiterführende Formen (optional):** BCNF, 4NF, 5NF  

---

## 3. Aufgabe: Tourenplaner

### 3.1 Konzeptionelles Datenmodell (ERM)

- **Entitäten & Attribute**  
  - **Tour** (TourID, Name, StartDatum, EndDatum)  
  - **Teilnehmer** (TeilnehmerID, Vorname, Nachname, Email)  
  - **Ort** (OrtID, Bezeichnung, Adresse)  

- **Beziehungen**  
  - **Teilnahme** (n:m zwischen Teilnehmer und Tour)  
    - Attribut: Buchungsdatum  
  - **TourEtappe** (n:m zwischen Tour und Ort)  
    - Attribut: Reihenfolge  

### 3.2 Logisches Datenmodell (ERD)

| Tabelle        | Attribute                                      | Schlüssel                                                      |
| -------------- | ---------------------------------------------- | -------------------------------------------------------------- |
| **Tour**       | TourID, Name, StartDatum, EndDatum             | PK: TourID                                                     |
| **Teilnehmer** | TeilnehmerID, Vorname, Nachname, Email         | PK: TeilnehmerID                                               |
| **Ort**        | OrtID, Bezeichnung, Adresse                    | PK: OrtID                                                      |
| **Buchung**    | TourID, TeilnehmerID, Buchungsdatum            | PK: (TourID, TeilnehmerID)<br>FK: TourID → Tour<br>FK: TeilnehmerID → Teilnehmer |
| **Tour_Ort**   | TourID, OrtID, Reihenfolge                     | PK: (TourID, OrtID)<br>FK: TourID → Tour<br>FK: OrtID → Ort     |

#### Normalisierungs-Check

- **1NF:** Alle Werte atomar  
- **2NF:** Keine partiellen Abhängigkeiten in den n:m-Tabellen (Buchung, Tour_Ort)  
- **3NF:** Keine transitiven Abhängigkeiten; alle Nicht-Schlüsselattribute hängen nur vom Primärschlüssel ab  

---

## 4. Identifying & Non-Identifying Relationships

### 4.1 Theorie-Zusammenfassung

**Identifying Relationship**  
- FK ist Teil des Primärschlüssels der Child-Tabelle  
- Child-Entität existiert nur im Kontext des Parent  
- Ändert sich der Parent, ändert sich damit die Identität des Child
