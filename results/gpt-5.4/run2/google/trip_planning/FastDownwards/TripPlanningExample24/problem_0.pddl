(define (problem european_trip_13_days_instance_problem)
  (:domain european_trip_13_days_instance)

  (:objects
    florence amsterdam riga - city

    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day

    f1 f2 f3 f4
    a1 a2 a3 a4 a5 a6
    r1 r2 r3 r4 r5 - count_token
  )

  (:init
    (current_day d1)

    (at florence)

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
    (last_day d13)

    (direct_flight florence amsterdam)
    (direct_flight amsterdam florence)
    (direct_flight amsterdam riga)
    (direct_flight riga amsterdam)

    (workshop_day d1)
    (workshop_day d2)
    (workshop_day d3)
    (workshop_day d4)

    (unused f1)
    (unused f2)
    (unused f3)
    (unused f4)
    (unused a1)
    (unused a2)
    (unused a3)
    (unused a4)
    (unused a5)
    (unused a6)
    (unused r1)
    (unused r2)
    (unused r3)
    (unused r4)
    (unused r5)

    (token_for_city f1 florence)
    (token_for_city f2 florence)
    (token_for_city f3 florence)
    (token_for_city f4 florence)

    (token_for_city a1 amsterdam)
    (token_for_city a2 amsterdam)
    (token_for_city a3 amsterdam)
    (token_for_city a4 amsterdam)
    (token_for_city a5 amsterdam)
    (token_for_city a6 amsterdam)

    (token_for_city r1 riga)
    (token_for_city r2 riga)
    (token_for_city r3 riga)
    (token_for_city r4 riga)
    (token_for_city r5 riga)
  )

  (:goal
    (and
      (workshop_attended)
      (trip_finished)

      (not (unused f1))
      (not (unused f2))
      (not (unused f3))
      (not (unused f4))

      (not (unused a1))
      (not (unused a2))
      (not (unused a3))
      (not (unused a4))
      (not (unused a5))
      (not (unused a6))

      (not (unused r1))
      (not (unused r2))
      (not (unused r3))
      (not (unused r4))
      (not (unused r5))
    )
  )
)