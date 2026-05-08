(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    frankfurt reykjavik split - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    (current_day d0)

    (direct frankfurt reykjavik)
    (direct reykjavik frankfurt)
    (direct split frankfurt)
    (direct frankfurt split)

    (next d0 d1)
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)

    (workshop_day d7 d8)
    (workshop_day d8 d9)
    (workshop_day d9 d10)

    (frankfurt_days_0)
    (reykjavik_days_0)
    (split_days_0)
  )

  (:goal
    (and
      (current_day d10)
      (frankfurt_days_2)
      (reykjavik_days_3)
      (split_days_7)
      (attended_workshop)
    )
  )
)