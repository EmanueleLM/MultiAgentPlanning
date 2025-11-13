(define (problem TripPlanningExample27)
  (:domain tripplanning)
  (:objects
    amsterdam santorini istanbul - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
    a1 a2 a3 a4 a5 a6 a7 - token
    s1 s2 s3 - token
    i1 i2 i3 i4 - token
  )
  (:init
    ; City classification
    (amsterdam amsterdam)
    (santorini santorini)
    (istanbul istanbul)

    ; Day sequencing
    (current d1)
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

    ; Direct flight network (only allowed edges)
    (direct amsterdam santorini)
    (direct santorini amsterdam)
    (direct amsterdam istanbul)
    (direct istanbul amsterdam)

    ; Days that must be in Santorini (relatives visit)
    (must-santorini d12)
    (must-santorini d13)
    (must-santorini d14)

    ; City-day tokens: enforce exact counts summing to 14
    ; Amsterdam: 7 days
    (token-city a1 amsterdam)
    (token-city a2 amsterdam)
    (token-city a3 amsterdam)
    (token-city a4 amsterdam)
    (token-city a5 amsterdam)
    (token-city a6 amsterdam)
    (token-city a7 amsterdam)
    (available a1)
    (available a2)
    (available a3)
    (available a4)
    (available a5)
    (available a6)
    (available a7)

    ; Santorini: exactly 3 days (and must be days 12-14)
    (token-city s1 santorini)
    (token-city s2 santorini)
    (token-city s3 santorini)
    (available s1)
    (available s2)
    (available s3)

    ; Istanbul: remaining 4 days
    (token-city i1 istanbul)
    (token-city i2 istanbul)
    (token-city i3 istanbul)
    (token-city i4 istanbul)
    (available i1)
    (available i2)
    (available i3)
    (available i4)
  )
  (:goal
    (and
      (assigned d14)
      (at d12 santorini)
      (at d13 santorini)
      (at d14 santorini)
    )
  )
)