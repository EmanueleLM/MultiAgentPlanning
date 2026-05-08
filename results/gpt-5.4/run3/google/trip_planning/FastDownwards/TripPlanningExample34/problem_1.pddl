(define (problem european_trip_9_days_instance_problem)
  (:domain european_trip_9_days_instance)

  (:objects
    frankfurt florence valencia - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )

  (:init
    (at frankfurt)

    (current_day d1)
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)

    (direct_flight frankfurt florence)
    (direct_flight florence frankfurt)
    (direct_flight frankfurt valencia)
    (direct_flight valencia frankfurt)
  )

  (:goal
    (and
      (visited_valencia_window)

      (occupied d1 frankfurt)
      (occupied d2 frankfurt)
      (occupied d3 frankfurt)
      (occupied d4 frankfurt)
      (occupied d5 frankfurt)

      (occupied d6 florence)
      (occupied d7 florence)
      (occupied d8 florence)
      (occupied d9 florence)
    )
  )
)