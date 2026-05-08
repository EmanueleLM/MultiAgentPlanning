(define (problem tripplanningexample1)
  (:domain trip_planning)

  ;;; Auditor note:
  ;;; Original requests: Split 6 days, Manchester 4 days, Riga 7 days -> total 17 > available 15.
  ;;; Minimal adjustment chosen: reduce Riga from 7 to 5 days (keeps travelers' Split=6 and Manchester=4).
  ;;; This yields totals: Riga 5 + Manchester 4 + Split 6 = 15.
  ;;; Flight connectivity encoded below: Riga <-> Manchester (bidirectional), Manchester -> Split (one-way).
  (:objects
    riga manchester split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )

  (:init
    ;; starting location: begin trip in Riga so known chain Riga -> Manchester -> Split is feasible
    (at riga)

    ;; all day tokens are initially unassigned
    (unassigned d1) (unassigned d2) (unassigned d3) (unassigned d4) (unassigned d5)
    (unassigned d6) (unassigned d7) (unassigned d8) (unassigned d9) (unassigned d10)
    (unassigned d11) (unassigned d12) (unassigned d13) (unassigned d14) (unassigned d15)

    ;; direct flight connectivity (only these transitions are allowed by fly action)
    (direct riga manchester)
    (direct manchester riga)
    (direct manchester split)
  )

  ;; Goal requires exactly the chosen allocation of the 15 day tokens:
  ;; - 5 days in Riga (d1..d5)
  ;; - 4 days in Manchester (d6..d9)
  ;; - 6 days in Split (d10..d15)
  ;; The planner must place the agent at the corresponding city before using 'stay' to assign that day's token,
  ;; which enforces that travel uses only the provided direct flights.
  (:goal (and
    (assigned d1 riga) (assigned d2 riga) (assigned d3 riga) (assigned d4 riga) (assigned d5 riga)
    (assigned d6 manchester) (assigned d7 manchester) (assigned d8 manchester) (assigned d9 manchester)
    (assigned d10 split) (assigned d11 split) (assigned d12 split) (assigned d13 split) (assigned d14 split) (assigned d15 split)
  ))
)