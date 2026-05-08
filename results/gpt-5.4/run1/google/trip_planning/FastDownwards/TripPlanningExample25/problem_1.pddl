(define (problem tripplanningexample25)
  (:domain european_trip_16_days)

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
      (current_day day_16)

      (visited_valencia)
      (visited_lyon)
      (visited_split)

      (in_city valencia day_1)
      (in_city valencia day_2)
      (in_city valencia day_3)
      (in_city valencia day_4)
      (in_city valencia day_5)

      (in_city lyon day_6)
      (in_city lyon day_7)
      (in_city lyon day_8)
      (in_city lyon day_9)
      (in_city lyon day_10)
      (in_city lyon day_11)

      (in_city split day_10)
      (in_city split day_11)
      (in_city split day_12)
      (in_city split day_13)
      (in_city split day_14)
      (in_city split day_15)
      (in_city split day_16)
    )
  )
)