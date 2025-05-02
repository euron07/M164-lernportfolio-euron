# Generalisierung & Spezialisierung

## 1. Was ist das?

Stell dir vor, du hast mehrere Gruppen wie **Mitarbeiter**, **Kunden** und **Fahrer**. Alle haben gemeinsame Infos wie Name und Adresse – aber auch eigene Eigenschaften. Wie speichert man das am besten in einer Datenbank?

- **Problem:** Gleiche Daten (z. B. Name) müssten mehrfach gespeichert werden. Das führt zu Fehlern und unnötiger Redundanz.
- **Lösung:**  
  → Gemeinsame Infos kommen in eine Oberkategorie, z. B. **Person**  
  → Spezielle Infos kommen in Unterkategorien, z. B. **Mitarbeiter**, **Kunde**, **Fahrer**  
  → Diese sind über eine **is_a-Beziehung** (z. B. über einen Fremdschlüssel) verbunden

Das ist ähnlich wie **Vererbung** in der objektorientierten Programmierung: `Person` als Oberklasse, `Kunde` & Co. als Unterklassen.

---

## 2. Einfaches Beispiel: Fahrzeuge

So könnte man ein Modell für Fahrzeuge bauen:

- **Obertyp** `Fahrzeug`:  
  - Felder: `FahrzeugID`, `Hersteller`, `Modell`, `Baujahr`
- **Untertypen**:  
  - `PKW`: `AnzahlSitze`, `Kofferraumvolumen`  
  - `LKW`: `ZulässigesGesamtgewicht`, `AnzahlAchsen`  
  - `Motorrad`: `Hubraum`, `Motortyp`  

Jedes spezielle Fahrzeug ist mit einem Eintrag in der `Fahrzeug`-Tabelle verknüpft.

---

## 3. Weitere Beispiele aus dem Alltag

| Obertyp       | Untertypen                   |
|---------------|-------------------------------|
| Produkt       | Buch, DVD, Software           |
| Benutzer      | Admin, Moderator, Gast        |
| Tier          | Hund, Katze, Vogel            |
| Mitarbeiter   | Lehrer, Ingenieur, Sekretärin |

---

## 4. Wie setzt man das technisch um?

### In der Datenbank

- **PostgreSQL:**  
  Nutzt `INHERITS` für echte Tabellenvererbung:

  ```sql
  CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    nachname VARCHAR(45),
    vorname  VARCHAR(45)
  );

  CREATE TABLE mitarbeiter (
    personalnummer INT,
    eintrittsdatum DATE
  ) INHERITS (person);
