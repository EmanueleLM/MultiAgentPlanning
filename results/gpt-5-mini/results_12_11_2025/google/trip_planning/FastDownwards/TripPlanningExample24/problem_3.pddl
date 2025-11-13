(define (problem europe-trip-problem)
  (:domain europe-trip)
  (:objects
    florence amsterdam riga - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )
  (:init
    ;; initial day and location
    (on_day d1)
    (at_city florence)

    ;; next chain d1->d2->...->d13
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
    ;; d13 is final (no next)

    ;; directed flight graph (explicit allowed edges, both directions where available)
    (direct florence amsterdam)
    (direct amsterdam florence)
    (direct amsterdam riga)
    (direct riga amsterdam)

    ;; workshop windows (days 1..4)
    (workshop_window d1)
    (workshop_window d2)
    (workshop_window d3)
    (workshop_window d4)

    ;; must_be constraints per audited plan (hard constraints)
    ;; Days 1-4: florence (exactly 4 contiguous days starting d1)
    (must_be d1 florence)
    (must_be d2 florence)
    (must_be d3 florence)
    (must_be d4 florence)

    ;; Days 5-10: amsterdam (6 contiguous days)
    (must_be d5 amsterdam)
    (must_be d6 amsterdam)
    (must_be d7 amsterdam)
    (must_be d8 amsterdam)
    (must_be d9 amsterdam)
    (must_be d10 amsterdam)

    ;; Days 11-13: riga (3 contiguous days)
    (must_be d11 riga)
    (must_be d12 riga)
    (must_be d13 riga)
  )

  (:goal
    (and
      ;; every day must be satisfied (consumed)
      (satisfied d1) (satisfied d2) (satisfied d3) (satisfied d4)
      (satisfied d5) (satisfied d6) (satisfied d7) (satisfied d8)
      (satisfied d9) (satisfied d10) (satisfied d11) (satisfied d12)
      (satisfied d13)
      ;; workshop attendance must have occurred at least once during the workshop window
      (attended)
    )
  )
)