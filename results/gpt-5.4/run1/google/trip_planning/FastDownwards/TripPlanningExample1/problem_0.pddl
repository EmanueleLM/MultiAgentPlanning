(define (problem european_trip_15_days_instance_problem)
  (:domain european_trip_15_days_instance)

  (:objects
    riga manchester split - city

    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day

    r0 r1 r2 r3 r4 r5 r6 r7 - riga_count
    m0 m1 m2 m3 m4 - manchester_count
    s0 s1 s2 s3 s4 s5 s6 - split_count
  )

  (:init
    (riga_level r0)
    (manchester_level m0)
    (split_level s0)

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
    (next_day d13 d14)
    (next_day d14 d15)

    (next_riga r0 r1)
    (next_riga r1 r2)
    (next_riga r2 r3)
    (next_riga r3 r4)
    (next_riga r4 r5)
    (next_riga r5 r6)
    (next_riga r6 r7)

    (next_manchester m0 m1)
    (next_manchester m1 m2)
    (next_manchester m2 m3)
    (next_manchester m3 m4)

    (next_split s0 s1)
    (next_split s1 s2)
    (next_split s2 s3)
    (next_split s3 s4)
    (next_split s4 s5)
    (next_split s5 s6)

    (direct_flight riga manchester)
    (direct_flight manchester riga)
    (direct_flight manchester split)
  )

  (:goal
    (and
      (planned d15)
      (riga_level r7)
      (manchester_level m4)
      (split_level s6)
    )
  )
)