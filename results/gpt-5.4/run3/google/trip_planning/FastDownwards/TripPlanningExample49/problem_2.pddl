(define (problem european_trip_13_days_instance_problem)
  (:domain european_trip_13_days_instance)

  (:objects
    reykjavik milan split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )

  (:init
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

    (direct milan reykjavik)
    (direct reykjavik milan)
    (direct milan split)
    (direct split milan)

    (early d1)
    (early d2)
    (early d3)
  )

  (:goal
    (and
      (in split d1)
      (in split d2)
      (in split d3)

      (in split d4)
      (in milan d5)
      (in milan d6)
      (in milan d7)
      (in milan d8)
      (in milan d9)
      (in milan d10)

      (in reykjavik d11)
      (in reykjavik d12)
      (in reykjavik d13)
    )
  )
)