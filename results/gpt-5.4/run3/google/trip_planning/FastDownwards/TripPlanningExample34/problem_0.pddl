(define (problem european_trip_9_days_instance_problem)
  (:domain european_trip_9_days_instance)

  (:objects
    frankfurt florence valencia - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )

  (:init
    (current_day d1)

    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)

    (last_day d9)

    (direct_flight frankfurt florence)
    (direct_flight florence frankfurt)
    (direct_flight valencia frankfurt)
    (direct_flight frankfurt valencia)
  )

  (:goal
    (and
      (assigned d1)
      (assigned d2)
      (assigned d3)
      (assigned d4)
      (assigned d5)
      (assigned d6)
      (assigned d7)
      (assigned d8)
      (assigned d9)

      (occupied d1 valencia)
      (occupied d2 valencia)

      (occupied d1 frankfurt)
      (occupied d2 frankfurt)
      (occupied d3 frankfurt)
      (occupied d4 frankfurt)
      (occupied d5 frankfurt)

      (occupied d1 florence)
      (occupied d2 florence)
      (occupied d3 florence)
      (occupied d4 florence)
    )
  )
)