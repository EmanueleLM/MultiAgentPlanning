(define (problem european_trip_13_days_instance)
  (:domain european_trip_13_days)

  (:objects
    stockholm athens mykonos - city

    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day

    s0 s1 s2 s3 s4 s5 s6 - count_stockholm
    a0 a1 a2 a3 a4 a5 - count_athens
    m0 m1 m2 m3 m4 - count_mykonos
  )

  (:init
    (direct_flight stockholm athens)
    (direct_flight athens stockholm)
    (direct_flight athens mykonos)
    (direct_flight mykonos athens)

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

    (at stockholm d1)

    (current_day d1)

    (stockholm_count s0)
    (athens_count a0)
    (mykonos_count m0)

    (next_stockholm s0 s1)
    (next_stockholm s1 s2)
    (next_stockholm s2 s3)
    (next_stockholm s3 s4)
    (next_stockholm s4 s5)
    (next_stockholm s5 s6)

    (next_athens a0 a1)
    (next_athens a1 a2)
    (next_athens a2 a3)
    (next_athens a3 a4)
    (next_athens a4 a5)

    (next_mykonos m0 m1)
    (next_mykonos m1 m2)
    (next_mykonos m2 m3)
    (next_mykonos m3 m4)
  )

  (:goal
    (and
      (trip_complete)
      (stockholm_count s6)
      (athens_count a5)
      (mykonos_count m4)
      (at stockholm d6)
    )
  )
)