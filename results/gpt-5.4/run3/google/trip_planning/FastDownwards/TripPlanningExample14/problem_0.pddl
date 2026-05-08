(define (problem european_trip_10_days_instance)
  (:domain european_trip_10_days)

  (:objects
    lyon frankfurt krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)

    (direct_flight lyon frankfurt)
    (direct_flight frankfurt lyon)
    (direct_flight frankfurt krakow)
    (direct_flight krakow frankfurt)

    (current_day d1)

    (lyon_0)
    (frankfurt_0)
    (krakow_0)
  )

  (:goal
    (and
      (day_assigned d1)
      (day_assigned d2)
      (day_assigned d3)
      (day_assigned d4)
      (day_assigned d5)
      (day_assigned d6)
      (day_assigned d7)
      (day_assigned d8)
      (day_assigned d9)
      (day_assigned d10)

      (at d8 krakow)
      (at d9 krakow)
      (at d10 krakow)

      (lyon_5)
      (frankfurt_2)
      (krakow_3)
    )
  )
)