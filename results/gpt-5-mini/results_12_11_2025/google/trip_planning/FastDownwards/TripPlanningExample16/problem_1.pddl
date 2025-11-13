(define (problem travel-integration-problem)
  (:domain travel-integration)
  (:objects
    prague vienna porto - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )

  (:init
    ; Day id markers
    (is-d1 d1) (is-d2 d2) (is-d3 d3)
    (is-d4 d4) (is-d5 d5) (is-d6 d6)
    (is-d7 d7) (is-d8 d8) (is-d9 d9)

    ; Successor (ordered days)
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)

    ; Workshop anchoring: days 1..3 must be Prague
    (workshop-day d1) (workshop-day d2) (workshop-day d3)

    ; Sequencing starter
    (ready d1)

    ; All days initially unassigned
    (unassigned d1) (unassigned d2) (unassigned d3)
    (unassigned d4) (unassigned d5) (unassigned d6)
    (unassigned d7) (unassigned d8) (unassigned d9)

    ; Direct-flight graph (symmetric)
    (direct prague vienna) (direct vienna prague)
    (direct vienna porto)  (direct porto vienna)

    ; Initial counts: 0 for each city
    (count-prague-0) (count-vienna-0) (count-porto-0)
  )

  (:goal (and
    ; Workshop days must be assigned to Prague (hard constraint)
    (assigned d1 prague)
    (assigned d2 prague)
    (assigned d3 prague)

    ; Every day must be assigned to some city (expressed as "not unassigned")
    (not (unassigned d1)) (not (unassigned d2)) (not (unassigned d3))
    (not (unassigned d4)) (not (unassigned d5)) (not (unassigned d6))
    (not (unassigned d7)) (not (unassigned d8)) (not (unassigned d9))

    ; Required counts (enforce Prague=3, Vienna=3, Porto=3)
    (count-prague-3)
    (count-vienna-3)
    (count-porto-3)
  ))
)