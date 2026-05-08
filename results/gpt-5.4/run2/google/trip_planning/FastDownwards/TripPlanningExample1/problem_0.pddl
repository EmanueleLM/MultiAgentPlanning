(define (problem european_trip_15_days_instance_problem)
  (:domain european_trip_15_days_instance)

  (:objects
    riga manchester split - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 - day
  )

  (:init
    (direct riga manchester)
    (direct manchester riga)
    (direct manchester split)

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

    (current_day day_1)
  )

  (:goal
    (and
      (assigned day_15)
      (current_day day_15)

      (at split day_1)
      (at split day_2)
      (at split day_3)
      (at split day_4)
      (at split day_5)
      (at split day_6)

      (at manchester day_7)
      (at manchester day_8)
      (at manchester day_9)
      (at manchester day_10)

      (at riga day_11)
      (at riga day_12)
      (at riga day_13)
      (at riga day_14)
      (at riga day_15)
      (at riga day_1)
      (at riga day_2)
    )
  )
)