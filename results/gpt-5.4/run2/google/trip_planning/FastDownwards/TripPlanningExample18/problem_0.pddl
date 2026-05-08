(define (problem european_trip_11_days_instance_problem)
  (:domain european_trip_11_days_instance)

  (:objects
    amsterdam vilnius bucharest - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day

    ams_1 ams_2 ams_3 ams_4 ams_5
    vil_1 vil_2
    buc_1 buc_2 buc_3 buc_4 buc_5 buc_6 - token
  )

  (:init
    (direct amsterdam bucharest)
    (direct bucharest amsterdam)
    (direct vilnius amsterdam)
    (direct amsterdam vilnius)

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

    (current_day day_1)

    (token_for_city ams_1 amsterdam)
    (token_for_city ams_2 amsterdam)
    (token_for_city ams_3 amsterdam)
    (token_for_city ams_4 amsterdam)
    (token_for_city ams_5 amsterdam)

    (token_for_city vil_1 vilnius)
    (token_for_city vil_2 vilnius)

    (token_for_city buc_1 bucharest)
    (token_for_city buc_2 bucharest)
    (token_for_city buc_3 bucharest)
    (token_for_city buc_4 bucharest)
    (token_for_city buc_5 bucharest)
    (token_for_city buc_6 bucharest)
  )

  (:goal
    (and
      (current_day day_11)
      (token_used ams_1)
      (token_used ams_2)
      (token_used ams_3)
      (token_used ams_4)
      (token_used ams_5)
      (token_used vil_1)
      (token_used vil_2)
      (token_used buc_1)
      (token_used buc_2)
      (token_used buc_3)
      (token_used buc_4)
      (token_used buc_5)
      (token_used buc_6)
      (met_friends)
    )
  )
)