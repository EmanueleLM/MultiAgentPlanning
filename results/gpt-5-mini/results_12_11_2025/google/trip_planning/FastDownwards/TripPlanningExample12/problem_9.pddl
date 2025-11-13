(define (problem trip-instance)
  (:domain trip-planner)
  (:objects
    amsterdam valencia tallinn - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )
  (:init
    ;; successor relation for days 1..15
    (succ d1 d2) (succ d2 d3) (succ d3 d4) (succ d4 d5)
    (succ d5 d6) (succ d6 d7) (succ d7 d8) (succ d8 d9)
    (succ d9 d10) (succ d10 d11) (succ d11 d12) (succ d12 d13)
    (succ d13 d14) (succ d14 d15)

    ;; direct flights (symmetric as given)
    (direct amsterdam tallinn)
    (direct tallinn amsterdam)
    (direct amsterdam valencia)
    (direct valencia amsterdam)

    ;; initial assignment: start in Valencia on day 1
    (assigned d1 valencia)
    (current d1)

    ;; all other days initially unassigned
    (unassigned d2) (unassigned d3) (unassigned d4) (unassigned d5)
    (unassigned d6) (unassigned d7) (unassigned d8) (unassigned d9)
    (unassigned d10) (unassigned d11) (unassigned d12) (unassigned d13)
    (unassigned d14) (unassigned d15)

    ;; Tallinn meeting window days 9..15
    (window-day d9) (window-day d10) (window-day d11)
    (window-day d12) (window-day d13) (window-day d14) (window-day d15)

    ;; identify Tallinn city
    (is-tallinn tallinn)
  )

  (:goal (and
    ;; final day must be the current day (plan spans exactly 15 days)
    (current d15)

    ;; contiguous assignments totaling 15 days:
    ;; Valencia: d1-d4 (4 days)
    (assigned d1 valencia) (assigned d2 valencia) (assigned d3 valencia) (assigned d4 valencia)
    ;; Amsterdam: d5-d8 (4 days)
    (assigned d5 amsterdam) (assigned d6 amsterdam) (assigned d7 amsterdam) (assigned d8 amsterdam)
    ;; Tallinn: d9-d15 (7 days)
    (assigned d9 tallinn) (assigned d10 tallinn) (assigned d11 tallinn) (assigned d12 tallinn)
    (assigned d13 tallinn) (assigned d14 tallinn) (assigned d15 tallinn)

    ;; require at least one Tallinn-window marking during days 9..15
    (tallinn-window)
  ))