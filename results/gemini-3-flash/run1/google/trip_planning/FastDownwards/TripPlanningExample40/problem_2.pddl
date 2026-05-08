(define (problem trip_planning_8days)
    (:domain trip_planning)
    (:objects
        oslo reykjavik manchester - city
        d1 d2 d3 d4 d5 d6 d7 d8 - day
    )
    (:init
        ;; Temporal order of days
        (next d1 d2)
        (next d2 d3)
        (next d3 d4)
        (next d4 d5)
        (next d5 d6)
        (next d6 d7)
        (next d7 d8)

        ;; Flight connections
        (can_fly oslo reykjavik)
        (can_fly reykjavik oslo)
        (can_fly manchester oslo)
        (can_fly oslo manchester)

        ;; Initial state: starting in Manchester on Day 1.
        (at manchester d1)
        (visited manchester d1)
    )
    (:goal
        (and
            ;; Manchester requirement: 2 days. 
            ;; Staying on D1 and D2 covers the wedding (D1-D2) and duration.
            (visited manchester d1)
            (visited manchester d2)

            ;; Oslo requirement: 6 days.
            ;; Overlapping on D2 and D7 allows 6 days to fit in the schedule.
            (visited oslo d2)
            (visited oslo d3)
            (visited oslo d4)
            (visited oslo d5)
            (visited oslo d6)
            (visited oslo d7)

            ;; Reykjavik requirement: 2 days.
            ;; Overlapping on D7 allows Reykjavik to occupy D7 and D8.
            (visited reykjavik d7)
            (visited reykjavik d8)

            ;; Ensure the agent completes the full 8-day itinerary.
            (at reykjavik d8)
        )
    )
)