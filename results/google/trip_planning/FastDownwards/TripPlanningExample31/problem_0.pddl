tags as requested.

<problem>
(define (problem trip-10days)
  (:domain trip-planning)

  (:objects
    frankfurt reykjavik split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    ;; day successor chain
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10)

    ;; start day pointer
    (current d1)

    ;; start location assumption: start in Frankfurt on day 1
    (at frankfurt d1)

    ;; Direct flights available (symmetric availability where specified)
    (flight frankfurt reykjavik)
    (flight reykjavik frankfurt)
    (flight frankfurt split)
    (flight split frankfurt)

    ;; numeric fluent initializations
    (= (days-in frankfurt) 1)    ; started in Frankfurt day 1 counts as a day spent
    (= (days-in reykjavik) 0)
    (= (days-in split) 0)
    (= (flight-count) 0)
  )

  ;; Goals and hard constraints:
  ;; - per-city min/max day bounds (Frankfurt: 1..2, Reykjavik: 1..3, Split: 1..7)
  ;; - Reykjavik must be visited on at least one of d8,d9,d10
  ;; - total days spent equals 10
  ;; - flight-count <= 3 (hard cap to enforce preference for fewer legs)
  ;; - final day pointer is d10 (itinerary covers all 10 days)
  (:goal
    (and
      (>= (days-in frankfurt) 1)
      (<= (days-in frankfurt) 2)

      (>= (days-in reykjavik) 1)
      (<= (days-in reykjavik) 3)

      (>= (days-in split) 1)
      (<= (days-in split) 7)

      ;; Reykjavik workshop hard constraint: at least one of d8, d9 or d10 must be spent in Reykjavik
      (or (at reykjavik d8) (at reykjavik d9) (at reykjavik d10))

      ;; total days must sum to 10
      (= (+ (days-in frankfurt) (days-in reykjavik) (days-in split)) 10)

      ;; enforce the flight-leg cap to respect the traveler's hard preference to minimize legs
      (<= (flight-count) 3)

      ;; itinerary must progress through to day 10
      (current d10)
    )
  )
)