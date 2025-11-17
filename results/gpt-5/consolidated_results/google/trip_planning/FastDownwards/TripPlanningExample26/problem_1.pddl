(define (problem TripPlanningExample26-problem)
  (:domain trip-planning-example26)

  (:objects
    ; cities
    porto berlin reykjavik - city
    ; days
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
    ; tokens: exact city-day quotas (Porto 5, Berlin 6, Reykjavik 5)
    p1 p2 p3 p4 p5 - token
    b1 b2 b3 b4 b5 b6 - token
    r1 r2 r3 r4 r5 - token
  )

  (:init
    ; day successor chain
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
    (next d11 d12)
    (next d12 d13)
    (next d13 d14)
    (next d14 d15)
    (next d15 d16)

    ; direct flights (only these pairs are allowed)
    (direct-flight porto berlin)
    (direct-flight berlin porto)
    (direct-flight berlin reykjavik)
    (direct-flight reykjavik berlin)

    ; start at day 1
    (current d1)

    ; token mapping and initial availability
    (token-for p1 porto) (unused p1)
    (token-for p2 porto) (unused p2)
    (token-for p3 porto) (unused p3)
    (token-for p4 porto) (unused p4)
    (token-for p5 porto) (unused p5)

    (token-for b1 berlin) (unused b1)
    (token-for b2 berlin) (unused b2)
    (token-for b3 berlin) (unused b3)
    (token-for b4 berlin) (unused b4)
    (token-for b5 berlin) (unused b5)
    (token-for b6 berlin) (unused b6)

    (token-for r1 reykjavik) (unused r1)
    (token-for r2 reykjavik) (unused r2)
    (token-for r3 reykjavik) (unused r3)
    (token-for r4 reykjavik) (unused r4)
    (token-for r5 reykjavik) (unused r5)
  )

  (:goal (and
    ; ordered progression completes at day 16
    (current d16)

    ; exactly one city per day across the horizon (all days assigned)
    (assigned d1)
    (assigned d2)
    (assigned d3)
    (assigned d4)
    (assigned d5)
    (assigned d6)
    (assigned d7)
    (assigned d8)
    (assigned d9)
    (assigned d10)
    (assigned d11)
    (assigned d12)
    (assigned d13)
    (assigned d14)
    (assigned d15)
    (assigned d16)

    ; enforce exact city-day counts via token consumption
    (used p1) (used p2) (used p3) (used p4) (used p5)
    (used b1) (used b2) (used b3) (used b4) (used b5) (used b6)
    (used r1) (used r2) (used r3) (used r4) (used r5)

    ; Reykjavik covers the meeting window [12..16]
    (city-on-day reykjavik d12)
    (city-on-day reykjavik d13)
    (city-on-day reykjavik d14)
    (city-on-day reykjavik d15)
    (city-on-day reykjavik d16)
  ))
)