(define (problem european_trip_11_days_instance)
  (:domain european_trip_11_days)

  (:objects
    amsterdam vilnius bucharest - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
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
    (final_day day_11)
  )

  (:goal
    (and
      (current_day day_11)
      (met_friends)

      (at amsterdam day_1)
      (at amsterdam day_2)
      (at amsterdam day_3)
      (at amsterdam day_4)
      (at amsterdam day_5)

      (at vilnius day_6)
      (at vilnius day_7)

      (at bucharest day_6)
      (at bucharest day_7)
      (at bucharest day_8)
      (at bucharest day_9)
      (at bucharest day_10)
      (at bucharest day_11)
    )
  )
)