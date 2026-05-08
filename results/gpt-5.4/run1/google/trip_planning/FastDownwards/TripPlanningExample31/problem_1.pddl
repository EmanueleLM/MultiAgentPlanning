(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    frankfurt reykjavik split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    f0 f1 f2 r0 r1 r2 r3 s0 s1 s2 s3 s4 s5 s6 s7 - count
  )

  (:init
    (current_day d1)
    (start_not_chosen)

    (frankfurt_days f0)
    (reykjavik_days r0)
    (split_days s0)

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

    (workshop_day d8)
    (workshop_day d9)
    (workshop_day d10)

    (direct_flight frankfurt reykjavik)
    (direct_flight reykjavik frankfurt)
    (direct_flight split frankfurt)
    (direct_flight frankfurt split)

    (next_frankfurt_count f0 f1)
    (next_frankfurt_count f1 f2)

    (next_reykjavik_count r0 r1)
    (next_reykjavik_count r1 r2)
    (next_reykjavik_count r2 r3)

    (next_split_count s0 s1)
    (next_split_count s1 s2)
    (next_split_count s2 s3)
    (next_split_count s3 s4)
    (next_split_count s4 s5)
    (next_split_count s5 s6)
    (next_split_count s6 s7)
  )

  (:goal
    (and
      (current_day d11)
      (frankfurt_days f2)
      (reykjavik_days r3)
      (split_days s7)
      (workshop_done)
    )
  )
)