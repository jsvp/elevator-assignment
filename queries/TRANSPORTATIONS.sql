CREATE VIEW TRANSPORTATIONS AS
/* The returned dataset describes each transportation, answering the questions
    - in which floor and when he/she got into the elevator?
    - in which floor and when each person jumped off the elevator?
*/

WITH transportations_cte AS (
    /* Find each person's 'out'-interactions after 'into'-interactions. */
    SELECT
        p.id AS person_id,
        i.timestamp AS into_timestamp,
        i.floor_number AS into_floor_number,
        o.timestamp AS out_timestamp,
        o.floor_number AS out_floor_number,
        ROW_NUMBER OVER (PARTITION BY i.person_id, i.timestamp ORDER BY o.timestamp) AS out_rownumber

    FROM PERSON AS p

    -- Join 'into'-interactions 
    INNER JOIN INTERACTION AS i ON
        i.person_id = p.id AND
        i.direction = 'into'

    -- Join 'out'-interactions 
    INNER JOIN INTERACTION AS o ON
        o.person_id = i.person_id AND
        o.direction = 'out'

    WHERE
        --Consider only those 'out'-interactions that take place within 60 minutes after the request.
        AND o.timestamp BETWEEN i.request_timestamp AND DATEADD(minutes, 60, i.request_timestamp)
)

SELECT
    person_id,
    into_timestamp,
    into_floor_number,
    out_timestamp,
    out_floor_number,
    DATEDIFF(second, into_timestamp, out_timestamp) AS transportation_duration_s
FROM transportations_cte

--Consider only the first interaction after the 'into'-interaction.
WHERE out_rownumber = 1
