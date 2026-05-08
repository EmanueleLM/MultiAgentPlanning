(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    frankfurt krakow dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 - count
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

    (direct frankfurt krakow)
    (direct krakow frankfurt)
    (direct dubrovnik frankfurt)
    (direct frankfurt dubrovnik)

    (count_next c0 c1)
    (count_next c1 c2)
    (count_next c2 c3)
    (count_next c3 c4)
    (count_next c4 c5)
    (count_next c5 c6)
    (count_next c6 c7)
    (count_next c7 c8)
    (count_next c8 c9)
    (count_next c9 c10)

    (current d1)
    (start_unset)

    (dubrovnik_count c0)
    (frankfurt_count c0)
    (krakow_count c0)
  )

  (:goal
    (and
      (current d11)
      (not (start_unset))
      (dubrovnik_count c7)
      (frankfurt_count c3)
      (krakow_count c2)
      (spent krakow d9)
    )
  )
)