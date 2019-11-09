-- Third interpretation of the task:
-- Grouping by title, getting aggregates of the price
SELECT p.title, count(r.barcode), min(r.price), avg(r.price), max(r.price)
FROM reports r
         JOIN pos p
              ON r.pos_id = p.id
GROUP BY p.title;
