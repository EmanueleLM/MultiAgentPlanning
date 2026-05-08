(define (problem trip_planning_example)
  (:domain trip_planning)
  (:objects
    helsinki barcelona florence - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
    v0 v1 v2 v3 v4 v5 v6 - count
  )
  (:init
    ;; Initial visit counts for all cities
    (day_count helsinki v0)
    (day_count barcelona v0)
    (day_count florence v0)

    ;; Temporal adjacency
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

    ;; Count sequence
    (next_val v0 v1)
    (next_val v1 v2)
    (next_val v2 v3)
    (next_val v3 v4)
    (next_val v4 v5)
    (next_val v5 v6)

    ;; Flight connectivity
    (can_fly helsinki barcelona)
    (can_fly barcelona helsinki)
    (can_fly barcelona florence)
    (can_fly florence barcelona)

    ;; Friend window in Florence
    (is_friend_window d9)
    (is_friend_window d10)
    (is_friend_window d11)
    (is_friend_window d12)
    (is_friend_window d13)
    (is_friend_window d14)
  )
  (:goal
    (and
      ;; Visit durations
      (day_count florence v6)
      (day_count barcelona v5)
      (day_count helsinki v5)
      
      ;; Special meeting
      (met_friend)
      
      ;; Trip completion within 14 days
      (current_day d14)
    )
  )
)