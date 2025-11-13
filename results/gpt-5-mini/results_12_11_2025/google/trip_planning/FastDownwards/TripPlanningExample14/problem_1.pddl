(define (problem trip-10days-lyon-frankfurt-krakow)
  (:domain travel-lyon-frankfurt-krakow)

  (:objects
    ;; days enumerated 1..10
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    ;; cities
    lyon frankfurt krakow - city
  )

  ;; Comments: soft preference status (informational)
  ;; - Preference: 7 days in Lyon -> NOT fully met; nearest-feasible Lyon days = 6 (days 1..6).
  ;; - Preference: 3 days in Krakow -> met (days 8..10).
  ;; - Preference: 2 days in Frankfurt -> NOT met; only 1 Frankfurt day (day 7) in nearest-feasible plan.
  ;; The PDDL below enforces hard constraints and encodes a feasible target itinerary consistent with the audited solution.

  (:init
    ;; Next chain: day order
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10)

    ;; Flight edges (bidirectional)
    (edge lyon frankfurt) (edge frankfurt lyon)
    (edge frankfurt krakow) (edge krakow frankfurt)
    ;; No direct edge between lyon and krakow (enforced by absence)

    ;; Initial timeline cursor and initial location (start city is Lyon on day 1)
    (current d1)
    (at d1 lyon)
    (assigned d1 lyon)
    (visited lyon)

    ;; Note: spent_in_* and attend_d* markers are absent initially and must be produced by actions
  )

  ;; Goals: enforce the audited target itinerary as hard constraints so a valid plan must match it.
  ;; This fixes the day-by-day city assignments to the nearest-feasible solution found by the auditor.
  (:goal (and
    ;; Day-by-day assignments (exact itinerary)
    (assigned d1 lyon) (at d1 lyon)
    (assigned d2 lyon) (at d2 lyon)
    (assigned d3 lyon) (at d3 lyon)
    (assigned d4 lyon) (at d4 lyon)
    (assigned d5 lyon) (at d5 lyon)
    (assigned d6 lyon) (at d6 lyon)
    (assigned d7 frankfurt) (at d7 frankfurt)
    (assigned d8 krakow) (at d8 krakow)
    (assigned d9 krakow) (at d9 krakow)
    (assigned d10 krakow) (at d10 krakow)

    ;; Attendance hard constraints: Krakow on days 8,9,10 (attendance markers must be set)
    (attend_d8) (attend_d9) (attend_d10)

    ;; Visit-each-city requirement
    (visited lyon) (visited frankfurt) (visited krakow)

    ;; Ensure spent_in_* markers are set (produced by mark_spent_in_* actions)
    (spent_in_lyon) (spent_in_frankfurt) (spent_in_krakow)

    ;; Final timeline cursor at last day and final location explicit
    (current d10)
    (at d10 krakow)
  ))

  ;; No metric/length specified; plan length determined by advancing current from d1 to d10 via stay_d/fly_d.
)