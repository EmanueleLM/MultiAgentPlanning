(define (problem trip-16days-audit)
  (:domain trip-integration)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
    athens zurich krakow - city
  )

  (:init
    ;---- explicit day-ordering (successor links) ----
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14) (next day14 day15) (next day15 day16)

    ;---- direct flight connectivity (bidirectional expressed as two facts) ----
    (direct-flight athens zurich)
    (direct-flight zurich athens)
    (direct-flight zurich krakow)
    (direct-flight krakow zurich)
    ; Note: No direct-flight fact between athens and krakow is provided (forbidden).

    ;---- Hard constraint: days 1..7 are in Athens (visiting relatives window enforced) ----
    (assigned day1) (at day1 athens)
    (assigned day2) (at day2 athens)
    (assigned day3) (at day3 athens)
    (assigned day4) (at day4 athens)
    (assigned day5) (at day5 athens)
    (assigned day6) (at day6 athens)
    (assigned day7) (at day7 athens)

    ; Days 8..16 are intentionally left unassigned so the planner can use stay/fly actions
    ; to produce a feasible assignment respecting direct-flight connectivity and the enforced
    ; hard Athena-window. The auditor's recommended allocation (Athens=7, Zurich=3, Krakow=6)
    ; is feasible and is the intended satisfying plan; the goal below enforces the final assignment.
  )

  (:goal (and
    ; Hard constraint — Athens days 1..7 must hold (already set in init; included here for clarity)
    (at day1 athens) (assigned day1)
    (at day2 athens) (assigned day2)
    (at day3 athens) (assigned day3)
    (at day4 athens) (assigned day4)
    (at day5 athens) (assigned day5)
    (at day6 athens) (assigned day6)
    (at day7 athens) (assigned day7)

    ; Auditor's recommended allocation encoded as hard requirements (ensures the planner
    ; can only succeed by producing the intended, connectivity-respecting itinerary).
    ; Days 8..10: Zurich (3 days)
    (at day8 zurich)  (assigned day8)
    (at day9 zurich)  (assigned day9)
    (at day10 zurich) (assigned day10)

    ; Days 11..16: Krakow (6 days)
    (at day11 krakow) (assigned day11)
    (at day12 krakow) (assigned day12)
    (at day13 krakow) (assigned day13)
    (at day14 krakow) (assigned day14)
    (at day15 krakow) (assigned day15)
    (at day16 krakow) (assigned day16)
  ))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Human-readable notes (comments only):
  ; - Hard constraints enforced: total trip is exactly days 1..16; exactly one city per day;
  ;   Athens occupied days 1..7; moves between consecutive days require direct flights
  ;   (Athens<->Zurich and Zurich<->Krakow only).
  ; - Original soft preferences: Athens=7, Krakow=6, Zurich=5 sum to 18 > 16 (infeasible).
  ;   Auditor recommended minimal-relaxation: prioritize Athens=7 (hard window) and Krakow=6,
  ;   giving Zurich 3 days. This is encoded above as hard requirements and yields the
  ;   proposed day-by-day itinerary.
  ; - The only valid flight transitions under this plan are:
  ;     flight day7 -> day8 : Athens -> Zurich
  ;     flight day10 -> day11: Zurich -> Krakow
  ; - If an alternative prioritization is desired (e.g., keep Zurich=5 instead of Krakow=6),
  ;   regenerate the model with that different hard allocation.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
)