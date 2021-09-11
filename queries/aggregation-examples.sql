/* Query #1: Average waiting time per person (form longest waiting-time to smallest). */
SELECT
    person_id,
    AVG(wait_duration_s) AS average_waiting_time_s
FROM WAIT
GROUP BY person_id
ORDER BY average_waiting_time DESC


/* Query #2: Average time inside elevator per person (form longest waiting-time to smallest). */
SELECT
    person_id,
    AVG(transportation_duration_s) AS average_time_in_elevator_s
FROM TRANSPORTATIONS
GROUP BY person_id
ORDER BY average_time_in_elevator_s DESC


/* Query #3: Average time inside elevator per person (form longest waiting-time to smallest). */
SELECT
    person_id,
    AVG(journey_duration_s) AS average_journey_time_s
FROM JOURNEYS
GROUP BY person_id
ORDER BY average_journey_time_s DESC