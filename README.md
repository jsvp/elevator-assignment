
# The assignment

- **Data model**: Details on the data model are available in `./data-model` folder. Make sure to take a look at [the ERD diagram](images/elevator-monitoring-erd.png) at least!
- **Aggregations**: The aggregations are available in `./queries` folder. `aggregations-examples.sql` includes some example queries, that use the views declared in the same folder (`WAITS.sql`, `TRANSPORTATIONS.sql` and `JOURNEYS.sql`). The aggregation queries make it possible to observe elevator usage and help out to see what kind of requirements they have. Moreover, the logic in the three views could easily be used to aggregate other metrics, for example determine what are the "rush hours" and which are the most popular floors or journeys.

<br>

# Terminology

- _request_: the act of summoning any of the _M_ elevators to the floor
- _transportation_: starts when the person gets into the elevator (at a certain floor) and ends when they jump off the elevator (at a certain floor) 
- _journey_: starts when they request an elevator (at a certain floor) and ends when they jump off the elevator (at a certain floor) 

<br>

# Assumptions

- The observation system is capable of identifying each person using the elevator.
- The observation system registers when the person 
    * requests an elevator at a certain floor
    * is inside one of the N elevators
    * jumps off an elevator at a certain floor
- Each person requests the elevator when they arrive at the elevator doors (even if this has been done by ohers)
