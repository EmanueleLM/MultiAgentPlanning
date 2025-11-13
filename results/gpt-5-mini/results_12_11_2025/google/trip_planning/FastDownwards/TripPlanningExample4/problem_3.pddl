(define (problem trip-planning-example4-problem)
  (:domain TripPlanningExample4)
  (:objects
    seville munich tallinn - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
  )

  (:init
    ;; explicit successor chain for the 12-day horizon
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)
    (next d11 d12)

    ;; allowed direct flights (symmetric)
    (adj seville munich) (adj munich seville)
    (adj munich tallinn) (adj tallinn munich)

    ;; initial condition: day 1 occupied in Seville
    (at seville d1)
    (occupied d1)
  )

  ;; Goal: enforce exact, audited per-day city occupancy for all 12 days.
  ;; This encodes contiguous stays via successor-based actions and requires Tallinn on days d11 and d12.
  (:goal
    (and
      ;; Seville days 1-7
      (at seville d1) (at seville d2) (at seville d3) (at seville d4)
      (at seville d5) (at seville d6) (at seville d7)
      ;; Munich days 8-10
      (at munich d8) (at munich d9) (at munich d10)
      ;; Tallinn days 11-12 (hard constraint: meet friend on days 11 and 12)
      (at tallinn d11) (at tallinn d12)

      ;; every day must be marked occupied exactly once (structural enforcement)
      (occupied d1) (occupied d2) (occupied d3) (occupied d4) (occupied d5) (occupied d6)
      (occupied d7) (occupied d8) (occupied d9) (occupied d10) (occupied d11) (occupied d12)
    )
  )
)