(define (problem tripplanningexample43)
    (:domain tripplanningexample43)
    (:objects
        d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d_end - day_index
        c0 c1 c2 c3 c4 - day_count
    )
    (:init
        (current_day d0)
        (at dublin) ; Arbitrary starting city as not specified in the problem
        (days_in_venice c0)
        (days_in_porto c0)
        (days_in_dublin c0)
        ;; (friends_met_in_venice) is implicitly false as it's not present here.

        ;; Day sequence (10 total days of activity, d0 to d9)
        (next_day_index d0 d1)
        (next_day_index d1 d2)
        (next_day_index d2 d3)
        (next_day_index d3 d4)
        (next_day_index d4 d5)
        (next_day_index d5 d6)
        (next_day_index d6 d7)
        (next_day_index d7 d8)
        (next_day_index d8 d9)
        (next_day_index d9 d_end) ; After d9, the trip is over, and goal checks apply

        ;; Day count sequence (up to 4 days spent in any specific city)
        (next_count c0 c1)
        (next_count c1 c2)
        (next_count c2 c3)
        (next_count c3 c4)

        ;; Direct flights (bidirectional as per problem statement)
        (direct_flight dublin porto)
        (direct_flight porto dublin)
        (direct_flight venice dublin)
        (direct_flight dublin venice)

        ;; Friend meeting window days: "between day 1 and day 4" (inclusive: d1, d2, d3, d4)
        (is_friend_window_day d1)
        (is_friend_window_day d2)
        (is_friend_window_day d3)
        (is_friend_window_day d4)
    )
    (:goal (and
        (current_day d_end)
        (days_in_venice c4)
        (days_in_porto c4)
        (days_in_dublin c4)
        (friends_met_in_venice)
    ))
)