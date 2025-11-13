(define (problem TripPlanningExample23)
  (:domain trip-planning)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 - day
    london bucharest riga - city
  )

  (:init
    ;; consecutive-day relation
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8)

    ;; direct-flight adjacency (both directions)
    (edge london bucharest) (edge bucharest london)
    (edge bucharest riga) (edge riga bucharest)

    ;; mark the first day
    (first d1)

    ;; initially all days unassigned; no city visited yet
    (unassigned d1) (unassigned d2) (unassigned d3) (unassigned d4)
    (unassigned d5) (unassigned d6) (unassigned d7) (unassigned d8)
    ;; (visited ...) are initially absent (false)
  )

  ;; Goals: enforce the selected itinerary exactly and ensure each city is visited.
  ;; This enforces contiguous blocks by requiring assignment of each day explicitly,
  ;; and forces travel actions only where direct edges exist between consecutive blocks.
  (:goal
    (and
      ;; Days 1-3: London (3 days)
      (assigned d1 london) (assigned d2 london) (assigned d3 london)
      ;; Day 4: Bucharest (1 day)
      (assigned d4 bucharest)
      ;; Days 5-8: Riga (4 days) — workshop window fully covered
      (assigned d5 riga) (assigned d6 riga) (assigned d7 riga) (assigned d8 riga)

      ;; Ensure each city was started/visited (enforces that each city block begins)
      (visited london) (visited bucharest) (visited riga)
    )
  )
)