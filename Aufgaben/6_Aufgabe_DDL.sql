-- 1. CREATE SCHEMA und Tabellen anlegen
CREATE SCHEMA IF NOT EXISTS `AufgabenDB`
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE `AufgabenDB`;

-- Tabelle tbl_fahrer
CREATE TABLE `tbl_fahrer` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Vorname` VARCHAR(45) NOT NULL,
  `Telefonnummer` VARCHAR(45),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4;

-- Tabelle tbl_disponent
CREATE TABLE `tbl_disponent` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Vorname` VARCHAR(45) NOT NULL,
  `Telefonnummer` VARCHAR(45),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4;


-- 2. DROP TABLE und Wiederherstellung
DROP TABLE IF EXISTS `tbl_disponent`;

-- Wiederherstellung per erneutem CREATE TABLE
CREATE TABLE `tbl_disponent` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Vorname` VARCHAR(45) NOT NULL,
  `Telefonnummer` VARCHAR(45),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4;


-- 3. Generalisierung: Oberentität tbl_Mitarbeiter
CREATE TABLE `tbl_Mitarbeiter` (
  `MA_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) NOT NULL,
  `Vorname` VARCHAR(30) NOT NULL,
  `Geburtsdatum` DATETIME,
  `Telefonnummer` VARCHAR(12),
  `Einkommen` FLOAT(10,2),
  PRIMARY KEY (`MA_ID`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4;


-- 4. ALTER TABLE MODIFY: Charset von Name & Vorname in latin1 ändern
ALTER TABLE `tbl_Mitarbeiter`
  MODIFY `Name`    VARCHAR(45) CHARACTER SET latin1 NOT NULL,
  MODIFY `Vorname` VARCHAR(30) CHARACTER SET latin1 NOT NULL;


-- 5. ALTER TABLE DROP COLUMN: gemeinsame Attribute löschen
ALTER TABLE `tbl_fahrer`
  DROP COLUMN `Name`,
  DROP COLUMN `Vorname`,
  DROP COLUMN `Telefonnummer`;

ALTER TABLE `tbl_disponent`
  DROP COLUMN `Name`,
  DROP COLUMN `Vorname`,
  DROP COLUMN `Telefonnummer`;


-- 6. Spezialisierung: Fremdschlüssel auf tbl_Mitarbeiter hinzufügen
ALTER TABLE `tbl_fahrer`
  ADD COLUMN `MA_ID` INT NOT NULL,
  ADD CONSTRAINT `FK_fahrer_mitarbeiter`
    FOREIGN KEY (`MA_ID`) REFERENCES `tbl_Mitarbeiter`(`MA_ID`);

ALTER TABLE `tbl_disponent`
  ADD COLUMN `MA_ID` INT NOT NULL,
  ADD CONSTRAINT `FK_disponent_mitarbeiter`
    FOREIGN KEY (`MA_ID`) REFERENCES `tbl_Mitarbeiter`(`MA_ID`);
