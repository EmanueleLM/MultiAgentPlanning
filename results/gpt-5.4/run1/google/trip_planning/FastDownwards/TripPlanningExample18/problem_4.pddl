(define (problem tripplanningexample18)
  (:domain european_trip_11_days)

  (:objects
    amsterdam vilnius bucharest - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (current_day day_1)

    (direct amsterdam bucharest)
    (direct bucharest amsterdam)
    (direct amsterdam vilnius)
    (direct vilnius amsterdam)

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
  )

  (:goal
    (and
      (current_day day_11)

      (in amsterdam day_1)
      (in amsterdam day_2)
      (in amsterdam day_3)
      (in amsterdam day_4)
      (in amsterdam day_5)

      (in vilnius day_6)
      (in vilnius day_7)

      (in bucharest day_6)
      (in bucharest day_7)
      (in bucharest day_8)
      (in bucharest day_9)
      (in bucharest day_10)
      (in bucharest day_11)

      (friends_met)
    )
  )
)