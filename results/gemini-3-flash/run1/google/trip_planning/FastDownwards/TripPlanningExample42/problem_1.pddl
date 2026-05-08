(define (problem trip_example_42)
    (:domain trip_planning)
    (:objects
        paris nice mykonos - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
        n0 n1 n2 n3 n4 n5 - count
    )

    (:init
        ;; Starting location and time
        (at paris)
        (current_day d1)
        (is_last_day d11)

        ;; Initialize stay counts
        (stay_count paris n0)
        (stay_count nice n0)
        (stay_count mykonos n0)

        ;; Day sequence
        (next_day d1 d2)
        (next_day d2 d3)
        (next_day d3 d4)
        (next_day d4 d5)
        (next_day d5 d6)
        (next_day d6 d7)
        (next_day d7 d8)
        (next_day d8 d9)
        (next_day d9 d10)
        (next_day d10 d11)

        ;; Count sequence
        (next_count n0 n1)
        (next_count n1 n2)
        (next_count n2 n3)
        (next_count n3 n4)
        (next_count n4 n5)

        ;; Flight connections
        (can_fly paris nice)
        (can_fly nice paris)
        (can_fly nice mykonos)
        (can_fly mykonos nice)
    )

    (:goal (and
        ;; 11 days total (handled by d1..d11 sequence and trip_done)
        (trip_done)

        ;; Paris duration (4 days) and friend visit (Days 1 to 4)
        (stay_count paris n4)
        (visited_at paris d1)
        (visited_at paris d2)
        (visited_at paris d3)
        (visited_at paris d4)

        ;; Nice duration (5 days)
        (stay_count nice n5)

        ;; Mykonos duration (4 days)
        (stay_count mykonos n4)
    ))
)