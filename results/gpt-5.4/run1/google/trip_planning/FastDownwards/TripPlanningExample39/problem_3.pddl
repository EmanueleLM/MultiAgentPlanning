(define (problem european_trip_12day_instance_problem)
  (:domain european_trip_12day_instance)

  (:objects
    porto barcelona florence - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )

  (:init
    (at porto)
    (current_day d1)

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

    (direct porto barcelona)
    (direct barcelona porto)
    (direct barcelona florence)
    (direct florence barcelona)

    (visit_window_day d1)
    (visit_window_day d2)
    (visit_window_day d3)
  )

  (:goal
    (and
      (current_day d13)
      (visited_relatives)

      (spent porto d1)
      (spent porto d2)
      (spent porto d3)

      (spent barcelona d4)
      (spent barcelona d5)
      (spent barcelona d6)
      (spent barcelona d7)
      (spent barcelona d8)
      (spent barcelona d9)
      (spent barcelona d10)

      (spent florence d11)
      (spent florence d12)
    )
  )
)