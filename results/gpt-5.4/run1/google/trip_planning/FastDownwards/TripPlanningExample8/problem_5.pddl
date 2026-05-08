(define (problem tripplanningexample8_problem)
  (:domain tripplanningexample8)

  (:objects
    athens krakow zurich - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 day_17 - day
  )

  (:init
    (direct zurich krakow)
    (direct krakow zurich)
    (direct athens zurich)
    (direct zurich athens)

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
    (next_day day_16 day_17)

    (current_day day_1)
    (at_city athens)
  )

  (:goal
    (and
      (current_day day_17)

      (day_in_city day_1 athens)
      (day_in_city day_2 athens)
      (day_in_city day_3 athens)
      (day_in_city day_4 athens)
      (day_in_city day_5 athens)
      (day_in_city day_6 athens)
      (day_in_city day_7 athens)

      (day_in_city day_8 zurich)
      (day_in_city day_9 krakow)
      (day_in_city day_10 krakow)
      (day_in_city day_11 krakow)
      (day_in_city day_12 krakow)
      (day_in_city day_13 krakow)
      (day_in_city day_14 krakow)

      (day_in_city day_15 zurich)
      (day_in_city day_16 zurich)
    )
  )
)