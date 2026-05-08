(define (problem trip_planning_example45_problem)
  (:domain trip_planning_example45)

  (:objects
    copenhagen lisbon florence - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8
    day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day

    len_0 len_1 len_2 len_3 len_4 len_5 len_6 - stay_len
  )

  (:init
    (direct copenhagen lisbon)
    (direct lisbon copenhagen)
    (direct lisbon florence)
    (direct florence lisbon)

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
    (next_day day_11 day_12)
    (next_day day_12 day_13)
    (next_day day_13 day_14)
    (next_day day_14 day_15)
    (next_day day_15 day_16)

    (remaining_after len_6 len_5)
    (remaining_after len_5 len_4)
    (remaining_after len_4 len_3)
    (remaining_after len_3 len_2)
    (remaining_after len_2 len_1)
    (remaining_after len_1 len_0)
    (zero_len len_0)

    (current_day day_1)
    (at copenhagen)

    (stay_length copenhagen len_6)
    (stay_length lisbon len_6)
    (stay_length florence len_3)

    (visited_copenhagen)

    (conf_day day_1)
    (conf_day day_7)
    (required_at day_1 copenhagen)
    (required_at day_7 copenhagen)
  )

  (:goal
    (and
      (current_day day_16)
      (at florence)
      (stay_length copenhagen len_0)
      (stay_length lisbon len_0)
      (stay_length florence len_0)
      (visited_copenhagen)
      (visited_lisbon)
      (visited_florence)
    )
  )
)