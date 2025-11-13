(define (problem travel-integration-problem)
  (:domain travel-integration)
  (:objects
    prague vienna porto - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )

  (:init
    ; identify days
    (is-d1 d1) (is-d2 d2) (is-d3 d3)
    (is-d4 d4) (is-d5 d5) (is-d6 d6)
    (is-d7 d7) (is-d8 d8) (is-d9 d9)

    ; successor chain (contiguous days)
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)

    ; workshop days (hard constraint)
    (workshop-day d1) (workshop-day d2) (workshop-day d3)

    ; sequencing control: start ready on d1
    (ready d1)

    ; all days initially unassigned
    (unassigned d1) (unassigned d2) (unassigned d3)
    (unassigned d4) (unassigned d5) (unassigned d6)
    (unassigned d7) (unassigned d8) (unassigned d9)

    ; direct flight graph (symmetric edges)
    (direct prague vienna) (direct vienna prague)
    (direct vienna porto)  (direct porto vienna)

    ; mark which object is which city for workshop constraints
    (is-prague prague)
    (is-vienna vienna)
    (is-porto porto)

    ; initial last city is Prague to anchor day 1 workshop assignment and contiguous occupancy
    (last prague)
  )

  (:goal (and
    ; explicit per-day assignments as reconciled: days 1-3 Prague, 4-6 Vienna, 7-9 Porto
    (at d1 prague)
    (at d2 prague)
    (at d3 prague)
    (at d4 vienna)
    (at d5 vienna)
    (at d6 vienna)
    (at d7 porto)
    (at d8 porto)
    (at d9 porto)

    ; no unassigned days remain (terminal condition)
    (not (unassigned d1)) (not (unassigned d2)) (not (unassigned d3))
    (not (unassigned d4)) (not (unassigned d5)) (not (unassigned d6))
    (not (unassigned d7)) (not (unassigned d8)) (not (unassigned d9))
  ))