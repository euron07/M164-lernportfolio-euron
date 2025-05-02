/* --- Unterabfrage: gewünschte Sparten + deren Ø-Einkaufspreis --- */
SELECT SUM(avg_einkaufspreis)   AS summe_avg_einkaufspreise
FROM (
        SELECT   s.sparten_id,
                 s.bezeichnung,
                 AVG(b.einkaufspreis) AS avg_einkaufspreis
        FROM     sparten              s
        JOIN     buecher_has_sparten  bs ON s.sparten_id = bs.sparten_sparten_id
        JOIN     buecher              b  ON bs.buecher_buecher_id = b.buecher_id
        GROUP BY s.sparten_id, s.bezeichnung
        HAVING   s.bezeichnung <> 'Humor'         -- Humor ausschließen
             AND AVG(b.einkaufspreis) > 10         -- nur > 10 CHF
     ) AS sparten_preise;


/* Liste zur Kontrolle – Name + #Publikationen -------------------- */
SELECT   vorname,
         nachname,
         anzahl_buecher
FROM (
        SELECT  a.autoren_id,
                a.vorname,
                a.nachname,
                COUNT(ab.buecher_buecher_id) AS anzahl_buecher
        FROM    autoren              a
        JOIN    autoren_has_buecher  ab ON a.autoren_id = ab.autoren_autoren_id
        GROUP BY a.autoren_id, a.vorname, a.nachname
        HAVING   COUNT(*) > 4
     ) AS bekannte_autoren;

/* Reine Zählung der bekannten Autor-innen ------------------------ */
SELECT COUNT(*) AS anzahl_bekannter_autoren
FROM (
        SELECT  a.autoren_id
        FROM    autoren              a
        JOIN    autoren_has_buecher  ab ON a.autoren_id = ab.autoren_autoren_id
        GROUP BY a.autoren_id
        HAVING  COUNT(*) > 4
     ) AS bekannte_autoren;

/* Unterabfrage: jeder Verlag + Ø-Gewinn pro Buch (< 10 CHF ) -------- */
SELECT AVG(avg_gewinn)  AS gesamt_ø_gewinn_der_verlage
FROM (
        SELECT  v.verlage_id,
                v.name,
                AVG(b.verkaufspreis - b.einkaufspreis) AS avg_gewinn
        FROM    verlage v
        JOIN    buecher  b ON v.verlage_id = b.verlage_verlage_id
        GROUP BY v.verlage_id, v.name
        HAVING  avg_gewinn < 10                  -- „weniger als 10 CHF Gewinn“
     ) AS schwachverdiener;
