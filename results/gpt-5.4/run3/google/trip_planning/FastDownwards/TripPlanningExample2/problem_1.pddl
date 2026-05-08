(define (problem tripplanningexample2)
  (:domain european_trip_11_days)

  (:objects
    reykjavik vienna venice - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
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

    (direct reykjavik vienna)
    (direct vienna reykjavik)
    (direct vienna venice)
    (direct venice vienna)
  )

  (:goal
    (and
      (current_day day_11)

      (at reykjavik day_1)
      (at reykjavik day_2)

      (at vienna day_3)
      (at vienna day_4)
      (at vienna day_5)
      (at vienna day_6)
      (at vienna day_7)
      (at vienna day_8)
      (at vienna day_9)

      (at venice day_8)
      (at venice day_9)
      (at venice day_10)
      (at venice day_11)
    )
  )
)