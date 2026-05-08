(define (problem trip_7_days)
        (:domain trip_planning)
        (:objects
            paris istanbul salzburg - city
            d1 d2 d3 d4 d5 d6 d7 d8 - day
            n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 - count
        )
        (:init
            ;; Initial Location and Time
            (at paris)
            (current_day d1)

            ;; Initial Counts
            (count paris n0)
            (count istanbul n0)
            (count salzburg n0)

            ;; Day Succession (7 days total, d8 is the end of day 7)
            (next_day d1 d2)
            (next_day d2 d3)
            (next_day d3 d4)
            (next_day d4 d5)
            (next_day d5 d6)
            (next_day d6 d7)
            (next_day d7 d8)

            ;; Count Levels
            (next_count n0 n1)
            (next_count n1 n2)
            (next_count n2 n3)
            (next_count n3 n4)
            (next_count n4 n5)
            (next_count n5 n6)
            (next_count n6 n7)
            (next_count n7 n8)
            (next_count n8 n9)

            ;; Flight Connections
            (can_fly paris istanbul)
            (can_fly istanbul paris)
            (can_fly istanbul salzburg)
            (can_fly salzburg istanbul)
        )
        (:goal
            (and
                ;; 5 days in Salzburg
                (count salzburg n5)
                ;; 2 days in Istanbul
                (count istanbul n2)
                ;; 2 days in Paris
                (count paris n2)
                ;; Conference in Paris on Day 1 and Day 2
                (visited paris d1)
                (visited paris d2)
            )
        )
    )