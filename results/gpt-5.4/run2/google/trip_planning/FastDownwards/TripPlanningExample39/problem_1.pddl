(define (problem tripplanningexample39_problem)
  (:domain tripplanningexample39)

  (:objects
    porto barcelona florence - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 - day
  )

  (:init
    (at porto)
    (today day_1)
    (start_day day_1)

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

    (porto_window_day day_1)
    (porto_window_day day_2)
    (porto_window_day day_3)

    (direct_flight porto barcelona)
    (direct_flight barcelona porto)
    (direct_flight barcelona florence)
    (direct_flight florence barcelona)

    (spent day_1 porto)
  )

  (:goal
    (and
      (spent day_1 porto)
      (spent day_2 porto)
      (spent day_3 porto)

      (spent day_4 barcelona)
      (spent day_5 barcelona)
      (spent day_6 barcelona)
      (spent day_7 barcelona)
      (spent day_8 barcelona)
      (spent day_9 barcelona)
      (spent day_10 barcelona)

      (spent day_11 florence)
      (spent day_12 florence)

      (spent day_10 florence)
      (spent day_9 florence)
    )
  )
)