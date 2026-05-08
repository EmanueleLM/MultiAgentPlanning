(define (problem tripplanningexample1)
  (:domain trip_planning)

  ;;; Auditor decision (minimal adjustment):
  ;;; Original requested days: Split=6, Manchester=4, Riga=7 -> total 17 > available 15.
  ;;; Minimal correction chosen: reduce Riga to 5 days; keep Split=6 and Manchester=4.
  ;;; This yields total 15 days. To make the travel chain feasible with only direct flights,
  ;;; the trip is set to start in Riga so the chain Riga -> Manchester -> Split is possible
  ;;; using the provided direct links.
  (:objects
    riga manchester split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )

  (:init
    ;; starting location chosen to allow chaining using only direct flights
    (at riga)

    ;; all day tokens initially unassigned
    (unassigned d1) (unassigned d2) (unassigned d3) (unassigned d4) (unassigned d5)
    (unassigned d6) (unassigned d7) (unassigned d8) (unassigned d9) (unassigned d10)
    (unassigned d11) (unassigned d12) (unassigned d13) (unassigned d14) (unassigned d15)

    ;; direct flight connectivity (only these transitions are allowed)
    ;; Public info: direct flights between Riga and Manchester; direct flight from Manchester to Split.
    (direct riga manchester)
    (direct manchester riga)
    (direct manchester split)
  )

  ;; Goal enforces the explicit allocation of all 15 day-tokens:
  ;; Riga: 5 days (d1..d5), Manchester: 4 days (d6..d9), Split: 6 days (d10..d15).
  ;; The planner must be at the corresponding city to use 'stay' on each token,
  ;; which enforces travel only along the declared direct flights.
  (:goal (and
    (assigned d1 riga) (assigned d2 riga) (assigned d3 riga) (assigned d4 riga) (assigned d5 riga)
    (assigned d6 manchester) (assigned d7 manchester) (assigned d8 manchester) (assigned d9 manchester)
    (assigned d10 split) (assigned d11 split) (assigned d12 split) (assigned d13 split) (assigned d14 split) (assigned d15 split)
  ))
)