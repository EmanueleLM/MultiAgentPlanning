(define (problem tripplanningexample37)
  (:domain europe_trip_10_days_instance)

  (:objects
    reykjavik milan porto - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (current day_1)

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
      (current day_11)

      (visited day_1 reykjavik)
      (visited day_2 reykjavik)
      (visited day_3 reykjavik)
      (visited day_4 reykjavik)
      (visited day_5 reykjavik)
      (visited day_6 reykjavik)

      (visited day_7 milan)
      (visited day_8 milan)

      (visited day_9 porto)
      (visited day_10 porto)
    )
  )
)