-- First interpretation of the task:
-- Getting all pairs of the reports where titles are matching
SELECT p1.title, r1.barcode, r1.price, count(r2.barcode), min(r2.price),
       avg(r2.price), max(r2.price)
FROM reports r1
         JOIN pos p1
              ON r1.pos_id = p1.id
         JOIN pos p2
              ON p2.title = p1.title
         JOIN reports r2
              ON r2.pos_id = p2.id
                  AND NOT r1.id = r2.id
GROUP BY p1.title, r1.id
