SELECT r1.user_id, COALESCE(SUM(r2.reward), 0) AS sum_reward
FROM reports r1
         -- To get all users, including users that did not
         -- generate any report in 2019,
         -- we need to make a self-join
         LEFT JOIN reports r2
                   ON r2.id = r1.id
                       AND EXTRACT(YEAR FROM r2.created_at) = 2019
WHERE r1.user_id IN (
    -- Getting users whose first report is in 2018
    SELECT user_id
    FROM reports
    GROUP BY user_id
    HAVING EXTRACT(YEAR FROM MIN(created_at)) = 2018
)
GROUP BY r1.user_id;