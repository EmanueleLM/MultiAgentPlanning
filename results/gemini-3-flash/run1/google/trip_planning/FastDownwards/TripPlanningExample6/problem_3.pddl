(define (problem trip_planning_example_6)
    (:domain trip_planning)
    (:objects
        berlin munich dubrovnik - city
        d1 d2 d3 d4 d5 d6 d7 d8 - day
        n0 n1 n2 n3 n4 n5 n6 n7 n8 - count
    )
    (:init
        ;; Initial status: Traveler starts in Berlin on Day 1
        (current_day d1)
        (at berlin d1)
        (visited berlin d1)

        ;; Initial visit counts: Day 1 in Berlin is already counted
        (visit_count berlin n1)
        (visit_count munich n0)
        (visit_count dubrovnik n0)

        ;; Sequential structures for days
        (next_day d1 d2)
        (next_day d2 d3)
        (next_day d3 d4)
        (next_day d4 d5)
        (next_day d5 d6)
        (next_day d6 d7)
        (next_day d7 d8)

        ;; Sequential structures for counts
        (next_count n0 n1)
        (next_count n1 n2)
        (next_count n2 n3)
        (next_count n3 n4)
        (next_count n4 n5)
        (next_count n5 n6)
        (next_count n6 n7)
        (next_count n7 n8)

        ;; Direct flights (bidirectional)
        (can_fly munich dubrovnik)
        (can_fly dubrovnik munich)
        (can_fly berlin munich)
        (can_fly munich berlin)
    )
    (:goal
        (and
            ;; Complete the 8-day trip
            (current_day d8)

            ;; Required visit durations for each city
            (visit_count berlin n4)
            (visit_count munich n3)
            (visit_count dubrovnik n3)

            ;; Conference requirements: Must be in Berlin on Day 1 and Day 4
            (visited berlin d1)
            (visited berlin d4)
        )
    )
)