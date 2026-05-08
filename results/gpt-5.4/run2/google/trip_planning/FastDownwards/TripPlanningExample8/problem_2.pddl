(define (problem europe_trip_16_days_instance_problem)
  (:domain europe_trip_16_days_instance)

  (:objects
    athens zurich krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    (direct athens zurich)
    (direct zurich athens)
    (direct zurich krakow)
    (direct krakow zurich)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    (next d10 d11)
    (next d11 d12)
    (next d12 d13)
    (next d13 d14)
    (next d14 d15)
    (next d15 d16)

    (current_day d1)
    (at athens)

    (need_athens_1)
    (need_krakow_1)
    (need_zurich_1)
  )

  (:goal
    (and
      (trip_finished)
      (visited athens d1)
      (visited athens d2)
      (visited athens d3)
      (visited athens d4)
      (visited athens d5)
      (visited athens d6)
      (visited athens d7)
    )
  )
)