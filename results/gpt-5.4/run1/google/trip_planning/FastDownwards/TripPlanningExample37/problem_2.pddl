(define (problem tripplanningexample37)
  (:domain europe_trip_10_days_instance)

  (:objects
    reykjavik milan porto - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (current_day day_1)
    (at reykjavik)

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

    (direct reykjavik milan)
    (direct milan reykjavik)
    (direct milan porto)
    (direct porto milan)
  )

  (:goal
    (and
      (current_day day_11)

      (spent day_1 reykjavik)
      (spent day_2 reykjavik)
      (spent day_3 reykjavik)
      (spent day_4 reykjavik)
      (spent day_5 reykjavik)
      (spent day_6 reykjavik)

      (spent day_7 milan)
      (spent day_8 milan)
      (spent day_9 porto)
      (spent day_10 porto)
    )
  )
)