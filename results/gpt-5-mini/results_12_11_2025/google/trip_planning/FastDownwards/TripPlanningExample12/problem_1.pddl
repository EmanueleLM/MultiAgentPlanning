(define (problem trip-instance)
  (:domain trip-planner)
  (:objects
    amsterdam valencia tallinn - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )
  (:init
    ;; successor relation for 15 consecutive days
    (succ d1 d2) (succ d2 d3) (succ d3 d4) (succ d4 d5)
    (succ d5 d6) (succ d6 d7) (succ d7 d8) (succ d8 d9)
    (succ d9 d10) (succ d10 d11) (succ d11 d12) (succ d12 d13)
    (succ d13 d14) (succ d14 d15)

    ;; direct-flight adjacency (symmetric) as given
    (direct amsterdam tallinn)
    (direct tallinn amsterdam)
    (direct amsterdam valencia)
    (direct valencia amsterdam)

    ;; start: day 1 in Valencia
    (assigned d1 valencia)
    (current d1)
    (visited valencia)

    ;; all other days initially unassigned
    (unassigned d2) (unassigned d3) (unassigned d4) (unassigned d5)
    (unassigned d6) (unassigned d7) (unassigned d8) (unassigned d9)
    (unassigned d10) (unassigned d11) (unassigned d12) (unassigned d13)
    (unassigned d14) (unassigned d15)

    ;; window days for Tallinn meeting requirement (days 9..15 inclusive)
    (window-day d9) (window-day d10) (window-day d11)
    (window-day d12) (window-day d13) (window-day d14) (window-day d15)
  )

  ;; Goals: span exactly 15 days (reach current d15), assign every day,
  ;; visit each city at least once, and ensure at least one Tallinn day falls in d9..d15.
  (:goal (and
    (current d15)

    ;; every day must be assigned (no unassigned days remain)
    (not (unassigned d1)) (not (unassigned d2)) (not (unassigned d3)) (not (unassigned d4))
    (not (unassigned d5)) (not (unassigned d6)) (not (unassigned d7)) (not (unassigned d8))
    (not (unassigned d9)) (not (unassigned d10)) (not (unassigned d11)) (not (unassigned d12))
    (not (unassigned d13)) (not (unassigned d14)) (not (unassigned d15))

    ;; each city must be visited at least once
    (visited amsterdam) (visited valencia) (visited tallinn)

    ;; ensure at least one Tallinn day is within the required window
    (tallinn-window)
  ))
)