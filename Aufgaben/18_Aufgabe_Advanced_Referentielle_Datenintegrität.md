# Referentielle Datenintegrität Advanced

---

## Ausgangslage – Schema  
```sql
DROP SCHEMA IF EXISTS foreignkey_tests;
CREATE SCHEMA foreignkey_tests DEFAULT CHARACTER SET latin1;
USE foreignkey_tests;

-- ORTE -------------------------------------------------
CREATE TABLE orte (
  postleitzahl VARCHAR(5) PRIMARY KEY,
  name         VARCHAR(45)
) ENGINE=InnoDB;

INSERT INTO orte VALUES
  ('10000','Musterhausen'),
  ('79092','Freiburg'),
  ('79102','Freiburg'),
  ('79312','Emmendingen');

-- KUNDEN  (CASCADE) -----------------------------------
CREATE TABLE kunden (
  idkunden         INT AUTO_INCREMENT PRIMARY KEY,
  name             VARCHAR(45),
  postleitzahl_FK  VARCHAR(5),
  CONSTRAINT fk_kunden_orte
    FOREIGN KEY (postleitzahl_FK)
    REFERENCES orte (postleitzahl)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO kunden VALUES
  (1,'Huber','10000'),
  (2,'Schmitt','10000'),
  (3,'Müller','79312'),
  (4,'Maier','79312'),
  (5,'Metz','79092'),
  (6,'Schmied','79102');

DELETE FROM orte;
SELECT * FROM kunden; 

-- Schema neu aufsetzen
DROP TABLE IF EXISTS kunden;
DROP TABLE IF EXISTS orte;
/* … orte wie oben … */

CREATE TABLE kunden (
  idkunden         INT AUTO_INCREMENT PRIMARY KEY,
  name             VARCHAR(45),
  postleitzahl_FK  VARCHAR(5),
  CONSTRAINT fk_kunden_orte
    FOREIGN KEY (postleitzahl_FK)
    REFERENCES orte (postleitzahl)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
);

DELETE FROM orte
WHERE name = 'Emmendingen';
-- Error 1451 (23000): Cannot delete or update a parent row

UPDATE orte
SET    postleitzahl = '99999'
WHERE  postleitzahl = '10000';
-- Error 1451 (23000): Cannot delete or update a parent row

-- Schema neu aufsetzen
DROP TABLE IF EXISTS kunden;
DROP TABLE IF EXISTS orte;
/* … orte wie oben … */

CREATE TABLE kunden (
  idkunden         INT AUTO_INCREMENT PRIMARY KEY,
  name             VARCHAR(45),
  postleitzahl_FK  VARCHAR(5),
  CONSTRAINT fk_kunden_orte
    FOREIGN KEY (postleitzahl_FK)
    REFERENCES orte (postleitzahl)
    ON DELETE SET NULL
    ON UPDATE NO ACTION
);

DELETE FROM orte
WHERE name = 'Emmendingen';

SELECT idkunden,name,postleitzahl_FK
FROM   kunden
WHERE  postleitzahl_FK IS NULL;

UPDATE orte
SET    postleitzahl = '99999'
WHERE  postleitzahl = '10000';
