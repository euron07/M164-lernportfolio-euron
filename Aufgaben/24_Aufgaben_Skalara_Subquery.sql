/* 1) Teuerstes Buch (höchster Verkaufspreis) */
SELECT *
FROM   buecher b
WHERE  b.verkaufspreis = (SELECT MAX(verkaufspreis) FROM buecher);

/* 2) Billigstes Buch (niedrigster Verkaufspreis) */
SELECT *
FROM   buecher b
WHERE  b.verkaufspreis = (SELECT MIN(verkaufspreis) FROM buecher);

/* 3) Bücher, deren Einkaufspreis über dem Durchschnitt aller Bücher liegt */
SELECT *
FROM   buecher b
WHERE  b.einkaufspreis > (SELECT AVG(einkaufspreis) FROM buecher);

/* 4) Bücher, deren Einkaufspreis über dem Durchschnitts-Einkaufspreis der Thriller liegt */
SELECT DISTINCT b.*
FROM   buecher b
WHERE  b.einkaufspreis >
       ( SELECT AVG(b_in.einkaufspreis)
         FROM   buecher                b_in
         JOIN   buecher_has_sparten    bs_in ON b_in.buecher_id = bs_in.buecher_buecher_id
         JOIN   sparten                s_in  ON bs_in.sparten_sparten_id = s_in.sparten_id
         WHERE  s_in.bezeichnung = 'Thriller'
       );

/* 5) Thriller, deren Einkaufspreis über dem Durchschnitts-Einkaufspreis der Thriller liegt */
SELECT b.*
FROM   buecher              b
JOIN   buecher_has_sparten  bs ON b.buecher_id = bs.buecher_buecher_id
JOIN   sparten              s  ON bs.sparten_sparten_id = s.sparten_id
WHERE  s.bezeichnung = 'Thriller'
  AND  b.einkaufspreis >
       ( SELECT AVG(b_in.einkaufspreis)
         FROM   buecher                b_in
         JOIN   buecher_has_sparten    bs_in ON b_in.buecher_id = bs_in.buecher_buecher_id
         JOIN   sparten                s_in  ON bs_in.sparten_sparten_id = s_in.sparten_id
         WHERE  s_in.bezeichnung = 'Thriller'
       );

/* 6) Bücher mit überdurchschnittlichem Gewinn – Buch-ID 22 nicht in der Durchschnitts­berechnung */
SELECT b.*,
       (b.verkaufspreis - b.einkaufspreis) AS gewinn
FROM   buecher b
WHERE  (b.verkaufspreis - b.einkaufspreis) >
       ( SELECT AVG(verkaufspreis - einkaufspreis)
         FROM   buecher
         WHERE  buecher_id <> 22
       );
