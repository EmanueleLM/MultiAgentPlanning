(define (problem european_trip_12day_instance_problem)
  (:domain european_trip_12day_instance)

  (:objects
    porto barcelona florence - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 - count
  )

  (:init
    (current d1)
    (at porto d1)

    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    (next_day d10 d11)
    (next_day d11 d12)
    (next_day d12 d13)

    (direct porto barcelona)
    (direct barcelona porto)
    (direct barcelona florence)
    (direct florence barcelona)

    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    (next_count c6 c7)
    (next_count c7 c8)
    (next_count c8 c9)
    (next_count c9 c10)
    (next_count c10 c11)
    (next_count c11 c12)

    (porto_count c0)
    (barcelona_count c0)
    (florence_count c0)
  )

  (:goal
    (and
      (current d13)

      (porto_count c3)
      (barcelona_count c7)
      (florence_count c4)

      (or
        (spent porto d1)
        (spent porto d2)
        (spent porto d3)
      )
    )
  )
)