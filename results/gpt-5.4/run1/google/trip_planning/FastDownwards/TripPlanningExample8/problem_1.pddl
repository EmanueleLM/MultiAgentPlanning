(define (problem tripplanningexample8_problem)
  (:domain tripplanningexample8)

  (:objects
    athens krakow zurich - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day
  )

  (:init
    (direct athens zurich)
    (direct zurich athens)
    (direct zurich krakow)
    (direct krakow zurich)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)
    (next day_10 day_11)
    (next day_11 day_12)
    (next day_12 day_13)
    (next day_13 day_14)
    (next day_14 day_15)
    (next day_15 day_16)

    (today day_1)
    (current_city athens)

    (visited_athens day_1)

    (need_athens_6)
    (need_krakow_6)
    (need_zurich_5)
  )

  (:goal
    (and
      (today day_16)
      (need_athens_0)
      (need_krakow_0)
      (need_zurich_0)
      (athens_window_done)
    )
  )
)