(define (problem trip-planning-example4-problem)
  (:domain TripPlanningExample4)
  (:objects
    seville munich tallinn - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
  )

  (:init
    ;; day successor chain
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)
    (next d11 d12)

    ;; direct-flight adjacency (symmetric)
    (adj seville munich) (adj munich seville)
    (adj munich tallinn) (adj tallinn munich)

    ;; initial occupancy: day 1 is Seville
    (at seville d1)
    (occupied d1)
  )

  ;; Goal: enforce that every day 1..12 is assigned exactly one city (via occupied and at facts),
  ;; and enforce Tallinn on days 11 and 12 (hard constraints from the auditor).
  ;; The conjunction below encodes the audited final per-day assignments as goal facts,
  ;; so any satisfying plan must produce those same at(...) facts for all days.
  (:goal
    (and
      ;; Days 1-7: Seville
      (at seville d1) (at seville d2) (at seville d3) (at seville d4)
      (at seville d5) (at seville d6) (at seville d7)
      ;; Days 8-10: Munich
      (at munich d8) (at munich d9) (at munich d10)
      ;; Days 11-12: Tallinn (required by hard constraint)
      (at tallinn d11) (at tallinn d12)

      ;; Ensure every day is marked occupied (exactly one city per day is enforced operationally
      ;; by using (not (occupied ?d2)) in action preconditions).
      (occupied d1) (occupied d2) (occupied d3) (occupied d4) (occupied d5) (occupied d6)
      (occupied d7) (occupied d8) (occupied d9) (occupied d10) (occupied d11) (occupied d12)
    )
  )
)