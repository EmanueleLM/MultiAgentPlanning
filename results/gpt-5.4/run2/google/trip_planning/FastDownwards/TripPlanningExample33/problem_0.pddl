(define (problem european_trip_instance)
  (:domain european_trip_13_days)

  (:objects
    barcelona krakow rome - city

    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day

    b0 b1 b2 b3 b4 b5 b6 b7 - bcount
    k0 k1 k2 k3 k4 - kcount
    r0 r1 r2 r3 r4 - rcount
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

    (direct_flight barcelona krakow)
    (direct_flight krakow barcelona)
    (direct_flight rome barcelona)
    (direct_flight barcelona rome)

    (meeting_day d10)
    (meeting_day d11)
    (meeting_day d12)
    (meeting_day d13)

    (bnext b0 b1)
    (bnext b1 b2)
    (bnext b2 b3)
    (bnext b3 b4)
    (bnext b4 b5)
    (bnext b5 b6)
    (bnext b6 b7)

    (knext k0 k1)
    (knext k1 k2)
    (knext k2 k3)
    (knext k3 k4)

    (rnext r0 r1)
    (rnext r1 r2)
    (rnext r2 r3)
    (rnext r3 r4)

    (bprog b0)
    (kprog k0)
    (rprog r0)
  )

  (:goal
    (and
      (current_day d13)
      (at barcelona d13)
      (bprog b7)
      (kprog k4)
      (rprog r4)
      (meeting_done)
    )
  )
)