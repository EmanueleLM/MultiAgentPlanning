(define (problem european_trip_13_days_instance_problem)
  (:domain european_trip_13_days_instance)

  (:objects
    reykjavik milan split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
    r0 r1 r2 r3 r4 r5 - rcount
    m0 m1 m2 m3 m4 m5 m6 m7 - mcount
    s0 s1 s2 s3 - scount
  )

  (:init
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

    (direct_flight milan reykjavik)
    (direct_flight reykjavik milan)
    (direct_flight milan split)
    (direct_flight split milan)

    (rnext r0 r1)
    (rnext r1 r2)
    (rnext r2 r3)
    (rnext r3 r4)
    (rnext r4 r5)

    (mnext m0 m1)
    (mnext m1 m2)
    (mnext m2 m3)
    (mnext m3 m4)
    (mnext m4 m5)
    (mnext m5 m6)
    (mnext m6 m7)

    (snext s0 s1)
    (snext s1 s2)
    (snext s2 s3)

    (early_day d1)
    (early_day d2)
    (early_day d3)

    (rvis r0)
    (mvis m0)
    (svis s0)
  )

  (:goal
    (and
      (day_assigned d1)
      (day_assigned d2)
      (day_assigned d3)
      (day_assigned d4)
      (day_assigned d5)
      (day_assigned d6)
      (day_assigned d7)
      (day_assigned d8)
      (day_assigned d9)
      (day_assigned d10)
      (day_assigned d11)
      (day_assigned d12)
      (day_assigned d13)
      (rvis r5)
      (mvis m7)
      (svis s3)
      (split_window_satisfied)
    )
  )
)