# Write your MySQL query statement below

WITH unique_num AS (

SELECT num
FROM MyNumbers
GROUP BY num
HAVING COUNT(num) = 1
)

SELECT MAX(num) AS num
FROM unique_num