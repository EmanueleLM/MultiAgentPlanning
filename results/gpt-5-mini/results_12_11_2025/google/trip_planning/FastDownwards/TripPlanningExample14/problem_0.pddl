(define (problem trip-10days-lyon-frankfurt-krakow)
  (:domain travel-lyon-frankfurt-krakow)

  (:objects
    ;; days explicitly enumerated 1..10
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    ;; three cities
    lyon frankfurt krakow - city
  )

  ;; Comments describing which soft preferences are met/violated:
  ;; Soft preference rank 1: Maximize Lyon days (target 7). Outcome: target not achievable due to hard constraints (Krakow days 8-10 and visit-all-cities).
  ;;   - In the audited target itinerary this preference is satisfied as far as possible: Lyon = 6 (nearest-feasible under hard constraints).
  ;; Soft preference rank 2: Spend 2 days in Frankfurt (target 2). Outcome: reduced to 1 day in nearest-feasible plan.
  ;; Soft preference rank 3: Spend 3 days in Krakow (target 3). Outcome: fully satisfied (days 8,9,10 in Krakow).
  ;; These comments are informational; the PDDL model enforces the audited itinerary as hard goals below.

  (:init
    ;; Next chain enforces the ordered sequence of days (no reordering/ping-pong)
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10)

    ;; Flight graph (bidirectional edges)
    (edge lyon frankfurt) (edge frankfurt lyon)
    (edge frankfurt krakow) (edge krakow frankfurt)
    ;; NOTE: no edge lyon <-> krakow per audited connectivity

    ;; Initial timeline cursor and initial location
    (current d1)
    (at d1 lyon)
    (assigned d1 lyon)
    (visited lyon)

    ;; All markers start unset (they will be set by dedicated actions after assignments)
    ;; (spent_in_lyon) etc. are not present in the initial state
    ;; (attend_d8), (attend_d9), (attend_d10) are not present initially
  )

  ;; Goals: encode the concrete audited target itinerary so that a plan exists and is unique up to the unavoidable action choices.
  ;; These goals fix every mandated terminal and intermediate assignment:
  (:goal (and
    ;; Day-by-day assignments per the audited target itinerary
    (assigned d1 lyon)  (at d1 lyon)
    (assigned d2 lyon)  (at d2 lyon)
    (assigned d3 lyon)  (at d3 lyon)
    (assigned d4 lyon)  (at d4 lyon)
    (assigned d5 lyon)  (at d5 lyon)
    (assigned d6 lyon)  (at d6 lyon)
    (assigned d7 frankfurt) (at d7 frankfurt)
    (assigned d8 krakow) (at d8 krakow)
    (assigned d9 krakow) (at d9 krakow)
    (assigned d10 krakow) (at d10 krakow)

    ;; Attendance hard constraint: physically in Krakow on days 8,9,10 (enforced by assignment above)
    ;; Additionally require the attendance markers to be set
    (attend_d8) (attend_d9) (attend_d10)

    ;; Visit-each-city rule: ensure each city was visited at least one full day
    (visited lyon) (visited frankfurt) (visited krakow)

    ;; Ensure the spent-in markers are set (these must be produced by the marking actions)
    (spent_in_lyon) (spent_in_frankfurt) (spent_in_krakow)

    ;; Enforce final timeline cursor to be at the last day (contiguity / ordering constraint)
    (current d10)

    ;; Ensure the final location is Krakow on day 10 as an explicit terminal condition
    (at d10 krakow)
  ))

  ;; Notes:
  ;; - Because the goal explicitly fixes which city is assigned to every day, the "exactly one city per day" and
  ;;   "visit the three cities" constraints are enforced by the goal. The action preconditions forbid assigning the
  ;;   same day to more than one city (negative preconditions check unassigned successor day).
  ;; - Movement is only allowed along declared edges; no direct Lyon<->Krakow flights exist in the initial state.
  ;; - Actions must advance the current day along the next chain; this enforces temporal contiguity and forbids reordering.
  ;; - Attendance markers (attend_d8/d9/d10) and spent_in_* markers must be produced by the marking actions included in the domain.
)