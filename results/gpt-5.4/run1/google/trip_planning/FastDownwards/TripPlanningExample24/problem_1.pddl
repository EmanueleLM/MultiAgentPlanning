(define (problem european_trip_13_days_instance_problem)
  (:domain european_trip_13_days_instance)

  (:objects
    florence amsterdam riga - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day

    count_0 count_1 count_2 count_3 count_4 count_5 count_6 - stay_count
  )

  (:init
    (at florence)

    (direct florence amsterdam)
    (direct amsterdam florence)
    (direct amsterdam riga)
    (direct riga amsterdam)

    (current_day day_1)
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

    (next_count count_0 count_1)
    (next_count count_1 count_2)
    (next_count count_2 count_3)
    (next_count count_3 count_4)
    (next_count count_4 count_5)
    (next_count count_5 count_6)

    (stayed florence count_0)
    (stayed amsterdam count_0)
    (stayed riga count_0)

    (workshop_window_day day_1)
    (workshop_window_day day_2)
    (workshop_window_day day_3)
    (workshop_window_day day_4)
  )

  (:goal
    (and
      (current_day day_14)
      (at riga)
      (workshop_attended)
      (stayed florence count_4)
      (stayed amsterdam count_6)
      (stayed riga count_5)
    )
  )
)