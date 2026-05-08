(define (problem trip_planning_8days)
    (:domain trip_planning)
    (:objects
        oslo reykjavik manchester - city
        d1 d2 d3 d4 d5 d6 d7 d8 - day
    )
    (:init
        ;; Time sequence
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

        ;; Starting condition
        ;; The trip starts in Manchester on Day 1.
        (at manchester d1)
        (visited manchester d1)
    )
    (:goal
        (and
            ;; Manchester: 2 days (Day 1 and Day 2).
            ;; This also covers the wedding requirement between Day 1 and Day 2.
            (visited manchester d1)
            (visited manchester d2)

            ;; Oslo: 6 days.
            ;; To fit into the 8-day timeline with Manchester and Reykjavik, 
            ;; Oslo must occupy the middle 6 days (including overlaps on Day 2 and Day 7).
            (visited oslo d2)
            (visited oslo d3)
            (visited oslo d4)
            (visited oslo d5)
            (visited oslo d6)
            (visited oslo d7)

            ;; Reykjavik: 2 days (Day 7 and Day 8).
            (visited reykjavik d7)
            (visited reykjavik d8)
        )
    )
)