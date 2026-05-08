(define (problem european_trip_13_days_instance_problem)
  (:domain european_trip_13_days_instance)

  (:objects
    barcelona krakow rome - city

    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day

    b0 b1 b2 b3 b4 b5 b6 b7 - count_barcelona
    k0 k1 k2 k3 k4 - count_krakow
    r0 r1 r2 r3 r4 - count_rome
  )

  (:init
    (today d1)

    (barcelona_count b0)
    (krakow_count k0)
    (rome_count r0)

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

    (direct barcelona krakow)
    (direct krakow barcelona)
    (direct rome barcelona)
    (direct barcelona rome)

    (next_barcelona b0 b1)
    (next_barcelona b1 b2)
    (next_barcelona b2 b3)
    (next_barcelona b3 b4)
    (next_barcelona b4 b5)
    (next_barcelona b5 b6)
    (next_barcelona b6 b7)

    (next_krakow k0 k1)
    (next_krakow k1 k2)
    (next_krakow k2 k3)
    (next_krakow k3 k4)

    (next_rome r0 r1)
    (next_rome r1 r2)
    (next_rome r2 r3)
    (next_rome r3 r4)

    (meeting_window d10)
    (meeting_window d11)
    (meeting_window d12)
    (meeting_window d13)
  )

  (:goal
    (and
      (today d14)
      (barcelona_count b7)
      (krakow_count k4)
      (rome_count r4)
      (met_friend_in_krakow)
      (visited barcelona)
      (visited krakow)
      (visited rome)
    )
  )
)