(define (problem travel-integration-problem)
  (:domain travel-integration)
  (:objects
    prague vienna porto - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )

  (:init
    ;; bind day identity helpers
    (is-d1 d1) (is-d2 d2) (is-d3 d3)
    (is-d4 d4) (is-d5 d5) (is-d6 d6)
    (is-d7 d7) (is-d8 d8) (is-d9 d9)

    ;; ordered successor chain over days
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)

    ;; workshop window (hard constraint) — days 1..3
    (workshop-day d1) (workshop-day d2) (workshop-day d3)

    ;; start ready at day 1
    (ready d1)

    ;; initially all days are unassigned
    (unassigned d1) (unassigned d2) (unassigned d3)
    (unassigned d4) (unassigned d5) (unassigned d6)
    (unassigned d7) (unassigned d8) (unassigned d9)

    ;; direct flight graph (symmetric edges)
    (direct prague vienna) (direct vienna prague)
    (direct vienna porto)  (direct porto vienna)

    ;; initial counts = 0 for each city
    (count-prague-0) (count-vienna-0) (count-porto-0)
  )

  (:goal (and
    ;; every day explicitly assigned to exactly one city (we ensure assigned for all days)
    (at d1 prague)
    (at d2 prague)
    (at d3 prague)
    (at d4 vienna)
    (at d5 vienna)
    (at d6 vienna)
    (at d7 porto)
    (at d8 porto)
    (at d9 porto)

    ;; all days must be consumed (no unassigned days remaining)
    (not (unassigned d1)) (not (unassigned d2)) (not (unassigned d3))
    (not (unassigned d4)) (not (unassigned d5)) (not (unassigned d6))
    (not (unassigned d7)) (not (unassigned d8)) (not (unassigned d9))

    ;; exact occupancy quotas (reconciled minimal-deviation)
    (count-prague-3)
    (count-vienna-3)
    (count-porto-3)
  ))