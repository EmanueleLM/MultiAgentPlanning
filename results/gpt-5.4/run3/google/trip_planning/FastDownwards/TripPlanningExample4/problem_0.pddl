(define (problem european_trip_12_days_instance)
  (:domain european_trip_12_days)

  (:objects
    seville munich tallinn - city

    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day

    s0 s1 s2 s3 s4 s5 s6 s7 - seville_count
    m0 m1 m2 m3 m4 m5 - munich_count
    t0 t1 t2 - tallinn_count
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
    (next_day d11 d12)
    (next_day d12 d13)

    (direct_flight seville munich)
    (direct_flight munich seville)
    (direct_flight munich tallinn)
    (direct_flight tallinn munich)

    (sev_prog s0)
    (mun_prog m0)
    (tal_prog t0)

    (sev_next s0 s1)
    (sev_next s1 s2)
    (sev_next s2 s3)
    (sev_next s3 s4)
    (sev_next s4 s5)
    (sev_next s5 s6)
    (sev_next s6 s7)

    (mun_next m0 m1)
    (mun_next m1 m2)
    (mun_next m2 m3)
    (mun_next m3 m4)
    (mun_next m4 m5)

    (tal_next t0 t1)
    (tal_next t1 t2)

    (meeting_window d11)
    (meeting_window d12)
  )

  (:goal
    (and
      (current_day d13)
      (sev_prog s7)
      (mun_prog m5)
      (tal_prog t2)
      (met_friend)
    )
  )
)