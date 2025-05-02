
-- Skript: filmeDatenbank_management.sql --


-- 1) Schema sicherstellen
CREATE SCHEMA IF NOT EXISTS `filmeDatenbank`
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE `filmeDatenbank`;

-- 2) Tabelle anlegen (falls nicht vorhanden)
CREATE TABLE IF NOT EXISTS `dvd_sammlung` (
  `id`             INT(11)      NOT NULL AUTO_INCREMENT,
  `film`           VARCHAR(255) NOT NULL,
  `nummer`         INT(11)      NOT NULL,
  `laenge_minuten` INT(11)      NOT NULL,
  `regisseur`      VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nummer` (`nummer`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4;

-- 3) Ausgangsdaten einfügen (UPSERT für Idempotenz)
INSERT INTO `dvd_sammlung` (`id`, `film`, `nummer`, `laenge_minuten`, `regisseur`)
VALUES
  (1,  'Meine Grossmutter lacht nie',             1, 119, 'Quentin Tarantino'),
  (2,  'Angst',                                   2,  92, 'Steven Spielberg'),
  (3,  'Wenn ich nur könnte',                    3,  89, 'Quentin Tarantino'),
  (4,  'Men and Mice',                            4,  88, 'Cohen'),
  (6,  'Grün ist die Farbe der Liebe',            5, 201, 'Quentin Tarantino'),
  (7,  'Frühstück in Sibirien',                   6,  72, 'Steven Spielberg'),
  (8,  'Das grosse Rennen',                        8,  83, 'Cohen'),
  (9,  'Das grosse Rennen, Teil 2',                9,  85, 'Cohen'),
  (10, 'Adlatus',                                 7, 131, 'Quentin Tarantino'),
  (11, 'Angriff auf Rom',                        10, 138, 'Steven Burghofer')
ON DUPLICATE KEY UPDATE
  `film`           = VALUES(`film`),
  `nummer`         = VALUES(`nummer`),
  `laenge_minuten` = VALUES(`laenge_minuten`),
  `regisseur`      = VALUES(`regisseur`);

-- 4) Korrekturen und Erweiterungen

-- 4.1 Regisseur "Cohen" vervollständigen
UPDATE `dvd_sammlung`
SET   `regisseur` = 'Etan Cohen'
WHERE `regisseur` = 'Cohen';

-- 4.2 Filmlänge für "Angst" korrigieren
UPDATE `dvd_sammlung`
SET   `laenge_minuten` = 120
WHERE `film` = 'Angst';

-- 4.3 Tabelle umbenennen: dvd_sammlung → bluray_sammlung
DROP TABLE IF EXISTS `bluray_sammlung`;
RENAME TABLE `dvd_sammlung` TO `bluray_sammlung`;

-- 4.4 Neue Spalte "Preis" hinzufügen
ALTER TABLE `bluray_sammlung`
  ADD COLUMN IF NOT EXISTS `Preis` DECIMAL(10,2) AFTER `laenge_minuten`;

-- 4.5 Entfernen des Films "Angriff auf Rom"
DELETE FROM `bluray_sammlung`
WHERE `kinofilme` = 'Angriff auf Rom'  -- wird gleich umbenannt, siehe 4.7
   OR `film` = 'Angriff auf Rom';

-- 4.6 Spalte "film" in "kinofilme" umbenennen
ALTER TABLE `bluray_sammlung`
  CHANGE COLUMN `film` `kinofilme` VARCHAR(255) NOT NULL;

-- 4.7 Spalte "nummer" entfernen
ALTER TABLE `bluray_sammlung`
  DROP COLUMN IF EXISTS `nummer`;

-- 5) Rückbau: gesamte Tabelle löschen
DROP TABLE IF EXISTS `bluray_sammlung`;
