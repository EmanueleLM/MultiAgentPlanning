(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    frankfurt reykjavik split - city

    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day

    f0 f1 f2 - fcount
    r0 r1 r2 r3 - rcount
    s0 s1 s2 s3 s4 s5 s6 s7 - scount
  )

  (:init
    (current_day d1)

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

    (workshop_window d8)
    (workshop_window d9)
    (workshop_window d10)

    (direct_flight frankfurt reykjavik)
    (direct_flight reykjavik frankfurt)
    (direct_flight split frankfurt)
    (direct_flight frankfurt split)

    (f_vis f0)
    (r_vis r0)
    (s_vis s0)

    (f_next f0 f1)
    (f_next f1 f2)

    (r_next r0 r1)
    (r_next r1 r2)
    (r_next r2 r3)

    (s_next s0 s1)
    (s_next s1 s2)
    (s_next s2 s3)
    (s_next s3 s4)
    (s_next s4 s5)
    (s_next s5 s6)
    (s_next s6 s7)
  )

  (:goal
    (and
      (current_day d11)
      (f_vis f2)
      (r_vis r3)
      (s_vis s7)
      (workshop_attended)
      (or (at frankfurt) (at reykjavik) (at split))
    )
  )
)