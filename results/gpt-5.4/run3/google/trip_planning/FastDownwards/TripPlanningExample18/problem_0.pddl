(define (problem european_trip_11_days_instance)
  (:domain european_trip_11_days)

  (:objects
    amsterdam vilnius bucharest - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day

    a_1 a_2 a_3 a_4 a_5
    v_1 v_2
    b_1 b_2 b_3 b_4 b_5 b_6 - quota_token
  )

  (:init
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)
    (next_day day_10 day_11)

    (last_day day_11)

    (can_follow amsterdam amsterdam)
    (can_follow vilnius vilnius)
    (can_follow bucharest bucharest)
    (can_follow amsterdam bucharest)
    (can_follow bucharest amsterdam)
    (can_follow vilnius amsterdam)
    (can_follow amsterdam vilnius)

    (meeting_window_day day_6)
    (meeting_window_day day_7)
    (meeting_window_day day_8)
    (meeting_window_day day_9)
    (meeting_window_day day_10)
    (meeting_window_day day_11)

    (city_bucharest bucharest)

    (token_for_city a_1 amsterdam)
    (token_for_city a_2 amsterdam)
    (token_for_city a_3 amsterdam)
    (token_for_city a_4 amsterdam)
    (token_for_city a_5 amsterdam)

    (token_for_city v_1 vilnius)
    (token_for_city v_2 vilnius)

    (token_for_city b_1 bucharest)
    (token_for_city b_2 bucharest)
    (token_for_city b_3 bucharest)
    (token_for_city b_4 bucharest)
    (token_for_city b_5 bucharest)
    (token_for_city b_6 bucharest)

    (unused_token a_1)
    (unused_token a_2)
    (unused_token a_3)
    (unused_token a_4)
    (unused_token a_5)
    (unused_token v_1)
    (unused_token v_2)
    (unused_token b_1)
    (unused_token b_2)
    (unused_token b_3)
    (unused_token b_4)
    (unused_token b_5)
    (unused_token b_6)
  )

  (:goal
    (and
      (assigned_day day_1)
      (assigned_day day_2)
      (assigned_day day_3)
      (assigned_day day_4)
      (assigned_day day_5)
      (assigned_day day_6)
      (assigned_day day_7)
      (assigned_day day_8)
      (assigned_day day_9)
      (assigned_day day_10)
      (assigned_day day_11)

      (current_day day_11)

      (not (unused_token a_1))
      (not (unused_token a_2))
      (not (unused_token a_3))
      (not (unused_token a_4))
      (not (unused_token a_5))
      (not (unused_token v_1))
      (not (unused_token v_2))
      (not (unused_token b_1))
      (not (unused_token b_2))
      (not (unused_token b_3))
      (not (unused_token b_4))
      (not (unused_token b_5))
      (not (unused_token b_6))

      (met_friends)
    )
  )
)