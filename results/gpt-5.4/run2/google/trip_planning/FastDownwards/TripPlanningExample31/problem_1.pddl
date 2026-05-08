(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    frankfurt reykjavik split - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    (at split)
    (current_day d0)

    (direct frankfurt reykjavik)
    (direct reykjavik frankfurt)
    (direct frankfurt split)
    (direct split frankfurt)

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

    (need_workshop d7)
    (need_workshop d8)
    (need_workshop d9)

    (count_frankfurt_0)
    (count_reykjavik_0)
    (count_split_0)
  )

  (:goal
    (and
      (current_day d10)
      (count_frankfurt_2)
      (count_reykjavik_3)
      (count_split_7)
      (workshop_done)
    )
  )
)