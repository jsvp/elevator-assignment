CREATE VIEW JOURNEYS AS
/* The dataset describes each journey, answering the questions
    - in which floor and when each person requested the elevator?
    - when he/she got into the elevator?
    - in which floor and when each person jumped off the elevator?
*/

SELECT
    i.person_id,
    i.request_timestamp,
    i.into_timestamp,
    i.into_floor_number,
    i.wait_duration_s,
    o.out_timestamp,
    o.out_floor_number,
    o.transportation_duration_s,
    wait_duration_s + transportation_duration_s AS journey_duration_s

FROM WAITS AS i

-- Join waits with transportation to form the "full" journey. 
INNER JOIN TRANSPORTATIONS AS o ON
    o.person_id = i.person_id AND
    o.into_floor_number = i.into_floor_number AND
    o.into_timestamp = i.into_timestamp
    