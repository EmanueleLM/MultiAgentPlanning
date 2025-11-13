(define (problem trip-planning-example4-problem)
  (:domain TripPlanningExample4)
  (:objects
    seville munich tallinn - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
  )

  (:init
    ;; day successor chain (explicit ordered stages)
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)
    (next d11 d12)

    ;; direct-flight adjacency (only allowed direct flights)
    (adj seville munich) (adj munich seville)
    (adj munich tallinn) (adj tallinn munich)

    ;; initial occupancy: day 1 is Seville and marked assigned
    (at seville d1)
    (occupied d1)
  )

  ;; Goal: exact, audited per-day assignments (enforces contiguous stays via successor-based actions).
  ;; This enforces: Seville days 1-7, Munich days 8-10, Tallinn days 11-12,
  ;; and every day 1..12 must be assigned a city (occupied predicate used by actions to prevent double assignment).
  (:goal
    (and
      ;; Days 1-7: Seville
      (at seville d1) (at seville d2) (at seville d3) (at seville d4)
      (at seville d5) (at seville d6) (at seville d7)
      ;; Days 8-10: Munich
      (at munich d8) (at munich d9) (at munich d10)
      ;; Days 11-12: Tallinn (hard constraint: meet friend on days 11 and 12)
      (at tallinn d11) (at tallinn d12)

      ;; Ensure every day is marked occupied (structural enforcement of one city per day).
      (occupied d1) (occupied d2) (occupied d3) (occupied d4) (occupied d5) (occupied d6)
      (occupied d7) (occupied d8) (occupied d9) (occupied d10) (occupied d11) (occupied d12)
    )
  )
)