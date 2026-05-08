(define (problem tripplanningexample36)
  (:domain european_trip_13_days)

  (:objects
    florence munich warsaw - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )

  (:init
    (direct florence munich)
    (direct florence warsaw)
    (direct munich florence)
    (direct munich warsaw)
    (direct warsaw florence)
    (direct warsaw munich)

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

    (current_day d1)
    (at florence)
    (day_in_city d1 florence)
  )

  (:goal
    (and
      (day_in_city d1 florence)
      (day_in_city d2 florence)

      (day_in_city d3 warsaw)
      (day_in_city d4 warsaw)
      (day_in_city d5 warsaw)
      (day_in_city d6 warsaw)
      (day_in_city d7 warsaw)
      (day_in_city d8 warsaw)
      (day_in_city d9 warsaw)

      (day_in_city d10 munich)
      (day_in_city d11 munich)
      (day_in_city d12 munich)
      (day_in_city d13 munich)
    )
  )
)