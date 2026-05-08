(define (problem tripplanningexample43)
    (:domain tripplanningexample43)
    (:objects
        venice porto dublin - city
        d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d_end - day_index
        c0 c1 c2 c3 c4 - day_count
    )
    (:init
        (current_day d0)
        (at dublin) ; Arbitrary starting city as not specified
        (days_in_venice c0)
        (days_in_porto c0)
        (days_in_dublin c0)
        (not (friends_met_in_venice))

        ;; Day sequence
        (next_day_index d0 d1)
        (next_day_index d1 d2)
        (next_day_index d2 d3)
        (next_day_index d3 d4)
        (next_day_index d4 d5)
        (next_day_index d5 d6)
        (next_day_index d6 d7)
        (next_day_index d7 d8)
        (next_day_index d8 d9)
        (next_day_index d9 d_end)

        ;; Day count sequence
        (next_count c0 c1)
        (next_count c1 c2)
        (next_count c2 c3)
        (next_count c3 c4)

        ;; Direct flights
        (direct_flight dublin porto)
        (direct_flight porto dublin)
        (direct_flight venice dublin)
        (direct_flight dublin venice)

        ;; Friend meeting window days (Day 1 to Day 4, 0-indexed: d0 to d3)
        (is_friend_window_day d0)
        (is_friend_window_day d1)
        (is_friend_window_day d2)
        (is_friend_window_day d3)
    )
    (:goal (and
        (current_day d_end)
        (days_in_venice c4)
        (days_in_porto c4)
        (days_in_dublin c4)
        (friends_met_in_venice)
    ))
)