(define (problem trip-16days-audit)
  (:domain trip-integration)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Instance objects
  ; Days 1..16 are represented explicitly as day1 .. day16
  ; Cities are the three required city constants.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

    ;---- Hard constraints enforced as initial assignments for days 1..7 (Athens window) ----
    (assigned day1) (at day1 athens)
    (assigned day2) (at day2 athens)
    (assigned day3) (at day3 athens)
    (assigned day4) (at day4 athens)
    (assigned day5) (at day5 athens)
    (assigned day6) (at day6 athens)
    (assigned day7) (at day7 athens)

    ; Days 8..16 start unassigned; the planner must assign them using stay / fly actions,
    ; but the auditor's recommended allocation (below) is encoded as the required goal.
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Goal: enforce the auditor's recommended allocation and flight order as hard constraints.
  ; This fixes every day to exactly one city (via 'at' facts) and ensures the
  ; consecutive-day transitions are consistent with direct-flight connectivity,
  ; because the only way to produce those 'at' facts for days 8..16 is via the
  ; stay / fly actions which enforce successor ordering and adjacency rules.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (:goal (and
    ; Days 1..7: hard constraint — Athens
    (at day1 athens) (assigned day1)
    (at day2 athens) (assigned day2)
    (at day3 athens) (assigned day3)
    (at day4 athens) (assigned day4)
    (at day5 athens) (assigned day5)
    (at day6 athens) (assigned day6)
    (at day7 athens) (assigned day7)

    ; Auditor's recommended resolution (encoded as hard constraints / goal facts):
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
  ; Comments: Soft preferences and reconciliation notes (human-readable only).
  ; These are NOT part of the PDDL model and are included as comments per spec.
  ;
  ; Preferred totals (original soft preferences):
  ;  - Athens: 7 days
  ;  - Krakow: 6 days
  ;  - Zurich: 5 days
  ; Sum = 18 > 16 (infeasible). Hard constraint (days1..7 = Athens) fixes Athens=7,
  ; leaving 9 days for Zurich+Krakow. Auditor recommended prioritization achieves:
  ;  - Athens = 7 (met)
  ;  - Krakow = 6 (met)
  ;  - Zurich = 3 (shortfall of 2 from preferred 5; unavoidable)
  ;
  ; Candidate itinerary (for reference) achieved Athens=7, Zurich=4, Krakow=5.
  ; Auditor's minimal-change recommendation moves day11 from Zurich -> Krakow,
  ; producing the schedule enforced above (days8-10 Zurich, days11-16 Krakow).
  ;
  ; If you prefer a different prioritization (e.g., keep Zurich=5 instead of Krakow=6),
  ; provide that instruction and an alternative hard schedule can be generated.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
)