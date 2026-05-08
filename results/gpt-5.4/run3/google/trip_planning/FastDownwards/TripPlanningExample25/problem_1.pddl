(define (problem european_trip_16days_instance_problem)
  (:domain european_trip_16days_instance)

  (:objects
    valencia lyon split - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day
  )

  (:init
    (direct lyon split)
    (direct split lyon)
    (direct valencia lyon)
    (direct lyon valencia)

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

    (current_day day_1)
  )

  (:goal
    (and
      (visited day_1 valencia)
      (visited day_2 valencia)
      (visited day_3 valencia)
      (visited day_4 valencia)
      (visited day_5 valencia)

      (visited day_6 lyon)
      (visited day_7 lyon)
      (visited day_8 lyon)
      (visited day_9 lyon)
      (visited day_10 lyon)
      (visited day_11 lyon)

      (visited day_10 split)
      (visited day_11 split)
      (visited day_12 split)
      (visited day_13 split)
      (visited day_14 split)
      (visited day_15 split)
      (visited day_16 split)

      (current_day day_16)
    )
  )
)