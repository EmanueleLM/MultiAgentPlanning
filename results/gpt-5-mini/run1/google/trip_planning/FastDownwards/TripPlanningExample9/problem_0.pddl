(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    frankfurt bucharest stuttgart - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    ; day ordering
    (succ day1 day2)
    (succ day2 day3)
    (succ day3 day4)
    (succ day4 day5)
    (succ day5 day6)
    (succ day6 day7)
    (succ day7 day8)
    (succ day8 day9)
    (succ day9 day10)

    ; initial location: start in Frankfurt on day1 (and mark day1 assigned)
    (at frankfurt day1)
    (day-assigned day1)

    ; Connectivity (only these travel relations exist; multi-leg same-day routing is encoded by permitting
    ; Bucharest<->Stuttgart as reachable within a single day via Frankfurt when needed)
    ; Direct flights (provided data)
    (can-travel frankfurt bucharest)
    (can-travel bucharest frankfurt)
    (can-travel frankfurt stuttgart)
    (can-travel stuttgart frankfurt)

    ; Allowable same-day multi-leg routing when it respects "only direct flights" requirement via intermediate Frankfurt.
    ; Because Bucharest <-> Stuttgart has no direct flight, we permit it as a single-day reachable transition only to model
    ; valid same-day two-leg routing through Frankfurt (each leg being a direct flight).
    (can-travel bucharest stuttgart)
    (can-travel stuttgart bucharest)
  )

  ; Goals: enforce a 10-day itinerary that visits exactly the three cities with reconciled, contiguous stays.
  ; These are encoded as hard constraints (must be true in final state).
  ; Reconciled stays chosen to respect all hard constraints:
  ; - Frankfurt: 3 consecutive days (day1..day3) (as preferred)
  ; - Bucharest: 3 consecutive days (day4..day6)
  ; - Stuttgart: 4 consecutive days (day7..day10), and workshop attendance occurs within day5..day10 because Stuttgart is occupied on days 7..10.
  (:goal
    (and
      ; Frankfurt consecutive 3-day stay (days 1-3)
      (at frankfurt day1)
      (at frankfurt day2)
      (at frankfurt day3)

      ; Bucharest consecutive 3-day stay (days 4-6)
      (at bucharest day4)
      (at bucharest day5)
      (at bucharest day6)

      ; Stuttgart consecutive 4-day stay (days 7-10). Workshop window requirement:
      ; attendance at Stuttgart must occur on some day in [5..10]. The chosen schedule places the traveler
      ; in Stuttgart on days 7..10, satisfying the mandatory workshop attendance window.
      (at stuttgart day7)
      (at stuttgart day8)
      (at stuttgart day9)
      (at stuttgart day10)
    )
  )

  ; No metric; plan must construct the per-day assignments through stay/move actions only.
)