(define (problem europe_trip_10_days_instance_problem)
  (:domain europe_trip_10_days_instance)

  (:objects
    lyon frankfurt krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    (direct lyon frankfurt)
    (direct frankfurt lyon)
    (direct frankfurt krakow)
    (direct krakow frankfurt)

    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)

    (last_day d10)
    (current_day d1)
    (start_pending)
  )

  (:goal
    (and
      (visited lyon)
      (visited frankfurt)
      (visited krakow)

      (occupied d1 lyon)
      (occupied d2 lyon)
      (occupied d3 lyon)
      (occupied d4 lyon)
      (occupied d5 lyon)
      (occupied d6 lyon)
      (occupied d7 lyon)

      (occupied d8 krakow)
      (occupied d9 krakow)
      (occupied d10 krakow)

      (occupied d1 frankfurt)
      (occupied d2 frankfurt)

      (processed d1)
      (processed d2)
      (processed d3)
      (processed d4)
      (processed d5)
      (processed d6)
      (processed d7)
      (processed d8)
      (processed d9)
      (processed d10)
    )
  )
)