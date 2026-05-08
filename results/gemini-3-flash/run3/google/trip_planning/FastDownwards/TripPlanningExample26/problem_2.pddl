(define (problem trip_example)
    (:domain trip_planning)
    (:objects
        porto berlin reykjavik - city
        d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
        c0 c1 c2 c3 c4 c5 c6 c7 - count_val
    )
    (:init
        (at_day d1)
        
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
        (next_day d11 d12)
        (next_day d12 d13)
        (next_day d13 d14)
        (next_day d14 d15)
        (next_day d15 d16)
        
        (next_count c0 c1)
        (next_count c1 c2)
        (next_count c2 c3)
        (next_count c3 c4)
        (next_count c4 c5)
        (next_count c5 c6)
        (next_count c6 c7)
        
        (visited_count porto c0)
        (visited_count berlin c0)
        (visited_count reykjavik c0)
        
        (connected porto berlin)
        (connected berlin porto)
        (connected berlin reykjavik)
        (connected reykjavik berlin)
        
        (friend_window d12)
        (friend_window d13)
        (friend_window d14)
        (friend_window d15)
        (friend_window d16)
        
        (is_reykjavik reykjavik)
    )
    (:goal (and
        (visited_count porto c7)
        (visited_count berlin c6)
        (visited_count reykjavik c5)
        (friend_met)
        (at_day d16)
    ))
)