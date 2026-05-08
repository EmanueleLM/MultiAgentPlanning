(define (problem tripplanningexample44_problem)
  (:domain tripplanningexample44)

  (:objects
    rome lyon zurich - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9
    day_10 day_11 day_12 day_13 day_14 day_15 day_16 day_17 - day
  )

  (:init
    (at rome)
    (current_day day_1)

    (direct rome lyon)
    (direct lyon rome)
    (direct rome zurich)
    (direct zurich rome)

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

    (in_zurich_on day_1)
    (in_zurich_on day_2)
    (in_zurich_on day_3)
    (in_zurich_on day_4)
    (in_zurich_on day_5)
    (in_zurich_on day_6)
    (in_zurich_on day_7)

    (in_lyon_on day_8)
    (in_lyon_on day_9)
    (in_lyon_on day_10)
    (in_lyon_on day_11)
    (in_lyon_on day_12)
    (in_lyon_on day_13)

    (in_rome_on day_14)
    (in_rome_on day_15)
    (in_rome_on day_16)
    (in_rome_on day_17)
    (in_rome_on day_2)
    (in_rome_on day_3)

    (wedding_day day_1)
    (wedding_day day_2)
    (wedding_day day_3)
    (wedding_day day_4)
    (wedding_day day_5)
    (wedding_day day_6)
    (wedding_day day_7)
  )

  (:goal
    (and
      (current_day day_17)
      (at rome)
    )
  )
)