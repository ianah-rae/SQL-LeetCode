# Write your MySQL query statement below


WITH activity_pivot as(
    SELECT machine_id,
           process_id,
        MAX(CASE WHEN activity_type = 'end' THEN timestamp ELSE NULL END) -
        MAX(CASE WHEN activity_type = 'start' THEN timestamp ELSE NULL END)  as time_to_complete
    FROM Activity
    GROUP BY machine_id, process_id
)

SELECT machine_id,
       ROUND(AVG(time_to_complete), 3) as processing_time
FROM activity_pivot
GROUP BY machine_id