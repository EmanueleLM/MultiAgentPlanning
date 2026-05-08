(define (problem trip_planning_example_6)
        (:domain trip_planning)
        (:objects
            berlin munich dubrovnik - city
            d1 d2 d3 d4 d5 d6 d7 d8 - day
            n0 n1 n2 n3 n4 n5 n6 n7 n8 - count
        )
        (:init
            ;; Initial Location and Day
            (current_city berlin)
            (current_day d1)
            (at berlin d1)

            ;; Initial Counts (Day 1 at Berlin is already counted)
            (berlin_count n1)
            (munich_count n0)
            (dubrovnik_count n0)

            ;; Day Succession
            (next_day d1 d2)
            (next_day d2 d3)
            (next_day d3 d4)
            (next_day d4 d5)
            (next_day d5 d6)
            (next_day d6 d7)
            (next_day d7 d8)

            ;; Count Succession
            (next_count n0 n1)
            (next_count n1 n2)
            (next_count n2 n3)
            (next_count n3 n4)
            (next_count n4 n5)
            (next_count n5 n6)
            (next_count n6 n7)
            (next_count n7 n8)

            ;; Flight Connectivity
            (can_fly munich dubrovnik)
            (can_fly dubrovnik munich)
            (can_fly berlin munich)
            (can_fly munich berlin)
        )
        (:goal
            (and
                ;; Total duration constraint
                (current_day d8)

                ;; Explicit Conference constraints
                (at berlin d1)
                (at berlin d4)

                ;; Desired visit durations
                (berlin_count n4)
                (munich_count n3)
                (dubrovnik_count n3)
            )
        )
    )