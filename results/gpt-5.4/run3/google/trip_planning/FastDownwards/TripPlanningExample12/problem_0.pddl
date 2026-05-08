(define (problem european_trip_15_days_instance_problem)
  (:domain european_trip_15_days_instance)

  (:objects
    amsterdam valencia tallinn - city

    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day

    amsterdam_day_1 amsterdam_day_2 amsterdam_day_3 amsterdam_day_4 amsterdam_day_5
    valencia_day_1 valencia_day_2 valencia_day_3 valencia_day_4 valencia_day_5
    tallinn_day_1 tallinn_day_2 tallinn_day_3 tallinn_day_4 tallinn_day_5 tallinn_day_6 tallinn_day_7
    - stay_token
  )

  (:init
    (current_day d1)
    (ready_to_spend)

    (can_start_in amsterdam)
    (can_start_in valencia)
    (can_start_in tallinn)

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

    (meeting_window_day d9)
    (meeting_window_day d10)
    (meeting_window_day d11)
    (meeting_window_day d12)
    (meeting_window_day d13)
    (meeting_window_day d14)
    (meeting_window_day d15)

    (direct_flight amsterdam tallinn)
    (direct_flight tallinn amsterdam)
    (direct_flight valencia amsterdam)
    (direct_flight amsterdam valencia)

    (token_for_city amsterdam_day_1 amsterdam)
    (token_for_city amsterdam_day_2 amsterdam)
    (token_for_city amsterdam_day_3 amsterdam)
    (token_for_city amsterdam_day_4 amsterdam)
    (token_for_city amsterdam_day_5 amsterdam)

    (token_for_city valencia_day_1 valencia)
    (token_for_city valencia_day_2 valencia)
    (token_for_city valencia_day_3 valencia)
    (token_for_city valencia_day_4 valencia)
    (token_for_city valencia_day_5 valencia)

    (token_for_city tallinn_day_1 tallinn)
    (token_for_city tallinn_day_2 tallinn)
    (token_for_city tallinn_day_3 tallinn)
    (token_for_city tallinn_day_4 tallinn)
    (token_for_city tallinn_day_5 tallinn)
    (token_for_city tallinn_day_6 tallinn)
    (token_for_city tallinn_day_7 tallinn)

    (unused amsterdam_day_1)
    (unused amsterdam_day_2)
    (unused amsterdam_day_3)
    (unused amsterdam_day_4)
    (unused amsterdam_day_5)

    (unused valencia_day_1)
    (unused valencia_day_2)
    (unused valencia_day_3)
    (unused valencia_day_4)
    (unused valencia_day_5)

    (unused tallinn_day_1)
    (unused tallinn_day_2)
    (unused tallinn_day_3)
    (unused tallinn_day_4)
    (unused tallinn_day_5)
    (unused tallinn_day_6)
    (unused tallinn_day_7)
  )

  (:goal
    (and
      (start_selected)
      (current_day d16)
      (ready_to_spend)
      (friend_met)

      (used amsterdam_day_1)
      (used amsterdam_day_2)
      (used amsterdam_day_3)
      (used amsterdam_day_4)
      (used amsterdam_day_5)

      (used valencia_day_1)
      (used valencia_day_2)
      (used valencia_day_3)
      (used valencia_day_4)
      (used valencia_day_5)

      (used tallinn_day_1)
      (used tallinn_day_2)
      (used tallinn_day_3)
      (used tallinn_day_4)
      (used tallinn_day_5)
      (used tallinn_day_6)
      (used tallinn_day_7)
    )
  )
)