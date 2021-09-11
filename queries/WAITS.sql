CREATE VIEW WAITS AS
/* The returned dataset describes each elevator waiting, answering the questions
    - in which floor and when each person requested the elevator?
    - when he/she got into the elevator?
*/

WITH waits_cte AS (
    /* Find each person's 'into'-interactions after requests. */
    SELECT
        p.id AS person_id,
        r.timestamp AS request_timestamp,
        i.timestamp AS into_timestamp,
        i.floor_number AS into_floor_number,
        ROW_NUMBER OVER (PARTITION BY r.person_id, r.timestamp ORDER BY i.timestamp) AS into_rownumber

    FROM PERSON AS p
    INNER JOIN REQUEST AS r ON
        r.person_id = p.id
    INNER JOIN INTERACTION AS i ON
        i.person_id = p.id AND
        i.floor_number = r.floor_number AND
        i.direction = 'into'

    WHERE
        --Consider only those 'into'-interactions that take place within 60 minutes after the request.
        i.timestamp BETWEEN r.timestamp AND DATEADD(minutes, 60, r.timestamp) AND
)

SELECT
    person_id,
    request_timestamp,
    into_timestamp,
    into_floor_number,
    DATEDIFF(second, request_timestamp, into_timestamp) AS wait_duration_s
FROM waits_ctes

--Consider only the first interaction after the request.
WHERE into_rownumber = 1
