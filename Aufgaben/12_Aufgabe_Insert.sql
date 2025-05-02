-- ========================================================
-- 1. Aufgabe: Neue Kunden anlegen
-- ========================================================

-- a) Kurzform: Heinrich Schmitt aus Zürich, Schweiz (land_id = 2)
INSERT INTO kunden
VALUES (NULL, 'Heinrich', 'Schmitt', 2, 'Zürich');

-- b) Kurzform: Sabine Müller aus Bern, Schweiz (land_id = 2)
INSERT INTO kunden
VALUES (NULL, 'Sabine', 'Müller', 2, 'Bern');

-- c) Kurzform: Markus Mustermann aus Wien, Österreich (land_id = 1)
INSERT INTO kunden
VALUES (NULL, 'Markus', 'Mustermann', 1, 'Wien');


-- d) Langform: Herr Maier (nur Vorname, Nachname)
INSERT INTO kunden (vorname, nachname)
VALUES ('Herr', 'Maier');

-- e) Langform: Herr Bulgur aus Sirnach (land_id = 2)
INSERT INTO kunden (vorname, nachname, land_id, wohnort)
VALUES ('Herr', 'Bulgur', 2, 'Sirnach');

-- f) Langform: Maria Manta (nur Vorname, Nachname)
INSERT INTO kunden (vorname, nachname)
VALUES ('Maria', 'Manta');


-- ========================================================
-- 2. Fehlerhafte INSERTs: Korrekturen
-- ========================================================

-- a) Fehlend: Tabellenname
--   INSERT INTO (nachname, wohnort, land_id) VALUES (...);
--   Korrekt:
INSERT INTO kunden (nachname, wohnort, land_id)
VALUES ('Fesenkampp', 'Duisburg', 3);

-- b) Falsche Anführungszeichen um Spaltenname
--   INSERT INTO kunden ('vorname') VALUES ('Herbert');
--   Korrekt:
INSERT INTO kunden (vorname)
VALUES ('Herbert');

-- c) land_id muss numerisch sein, nicht 'Deutschland'
--   INSERT INTO kunden (nachname, vorname, wohnort, land_id)
--   VALUES ('Schulter','Albert','Duisburg','Deutschland');
--   Korrekt (z. B. land_id=4 für Deutschland):
INSERT INTO kunden (nachname, vorname, wohnort, land_id)
VALUES ('Schulter','Albert','Duisburg', 4);

-- d) Ungültige Syntax, keine Spalten, falsche VALUES-Anzahl
--   INSERT INTO kunden ('', 'Brunhild', 'Sulcher', 1, 'Süderstade');
--   Korrekt (langform):
INSERT INTO kunden (vorname, nachname, land_id, wohnort)
VALUES ('Brunhild','Sulcher', 1,'Süderstade');

-- e) VALUES ohne Spaltenliste, nur 4 Werte statt 5
--   INSERT INTO kunden VALUES ('Jochen','Schmied',2,'Solingen');
--   Korrekt:
INSERT INTO kunden
VALUES (NULL,'Jochen','Schmied', 2,'Solingen');

-- f) VALUES ohne Spaltenliste, leere Strings
--   INSERT INTO kunden VALUES ('','Doppelbrecher',2,'');
--   Korrekt (NULL für Auto-ID, NULL für unbekannte Spalte):
INSERT INTO kunden
VALUES (NULL,'','Doppelbrecher', 2, NULL);

-- g) Falsche Anzahl Werte vs. Spalten
--   INSERT INTO kunden (nachname, wohnort, land_id)
--   VALUES ('Christoph','Fesenkampp','Duisburg',3);
-- Korrekt: entweder Spalte film weglassen oder Werte matchen
INSERT INTO kunden (nachname, wohnort, land_id)
VALUES ('Christoph','Fesenkampp',3);

-- h) Dieser Eintrag ist syntaktisch korrekt, fügt nur Vorname ein:
INSERT INTO kunden (vorname)
VALUES ('Herbert');

-- i) Fehlende Anführungszeichen um Literale
--   INSERT INTO kunden (nachname, vorname, wohnort, land_id)
--   VALUES (Schulter, Albert, Duisburg, 1);
-- Korrekt:
INSERT INTO kunden (nachname, vorname, wohnort, land_id)
VALUES ('Schulter','Albert','Duisburg',1);

-- j) Falsches Schlüsselwort VALUE statt VALUES
--   INSERT INTO kunden VALUE ('', "Brunhild", "Sulcher", 1, "Süderstade");
--   Korrekt:
INSERT INTO kunden
VALUES (NULL,'Brunhild','Sulcher',1,'Süderstade');

-- k) Gleiches wie j), plus unquoted String
--   INSERT INTO kunden VALUE ('','Jochen','Schmied',2,Solingen);
--   Korrekt:
INSERT INTO kunden
VALUES (NULL,'Jochen','Schmied',2,'Solingen');
