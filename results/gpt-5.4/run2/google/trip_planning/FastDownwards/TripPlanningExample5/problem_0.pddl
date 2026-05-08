(define (problem european_trip_16_days_instance)
  (:domain european_trip_16_days)

  (:objects
    oslo porto dubrovnik - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8
    day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day
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
    (next day_11 day_12)
    (next day_12 day_13)
    (next day_13 day_14)
    (next day_14 day_15)
    (next day_15 day_16)

    (direct oslo dubrovnik)
    (direct dubrovnik oslo)
    (direct porto oslo)
    (direct oslo porto)
  )

  (:goal
    (and
      (finished)

      (assigned day_1)
      (assigned day_2)
      (assigned day_3)
      (assigned day_4)
      (assigned day_5)
      (assigned day_6)
      (assigned day_7)
      (assigned day_8)
      (assigned day_9)
      (assigned day_10)
      (assigned day_11)
      (assigned day_12)
      (assigned day_13)
      (assigned day_14)
      (assigned day_15)
      (assigned day_16)

      (at_day dubrovnik day_12)
      (at_day dubrovnik day_16)

      ; exact 6 days in oslo
      (at_day oslo day_1)
      (at_day oslo day_2)
      (at_day oslo day_3)
      (at_day oslo day_4)
      (at_day oslo day_5)
      (at_day oslo day_6)

      ; exact 7 days in porto
      (at_day porto day_7)
      (at_day porto day_8)
      (at_day porto day_9)
      (at_day porto day_10)
      (at_day porto day_11)
      (at_day porto day_12)
      (at_day porto day_13)

      ; exact 5 days in dubrovnik
      (at_day dubrovnik day_12)
      (at_day dubrovnik day_13)
      (at_day dubrovnik day_14)
      (at_day dubrovnik day_15)
      (at_day dubrovnik day_16)
    )
  )
)