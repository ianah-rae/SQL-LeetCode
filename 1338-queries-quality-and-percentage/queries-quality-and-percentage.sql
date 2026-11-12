# Write your MySQL query statement below

WITH poor_query as (

SELECT 
    *,
    rating < 3 as poor_query

FROM Queries

),

quality_rating as (

SELECT 
    query_name,
    AVG((rating/position)) as quality,
    SUM(poor_query)/COUNT(result)*100 as poor_query_percentage

FROM poor_query
GROUP BY query_name
)

SELECT
    query_name,
    ROUND(quality, 2) as quality,
    ROUND(poor_query_percentage, 2) as poor_query_percentage
FROM quality_rating
