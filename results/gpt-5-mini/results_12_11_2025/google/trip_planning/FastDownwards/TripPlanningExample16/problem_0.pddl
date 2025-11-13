(define (problem travel-integration-problem)
  (:domain travel-integration)
  (:objects
    prague vienna porto - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )

  (:init
    ; Day id mappings
    (is-d1 d1) (is-d2 d2) (is-d3 d3) (is-d4 d4) (is-d5 d5) (is-d6 d6) (is-d7 d7) (is-d8 d8) (is-d9 d9)

    ; Successor relation explicit (enforce ordered sequence)
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)

    ; Workshop constraints: days 1..3 anchored to Prague (workshop-day)
    (workshop-day d1) (workshop-day d2) (workshop-day d3)

    ; Sequence starter
    (ready d1)

    ; All days initially unassigned
    (unassigned d1) (unassigned d2) (unassigned d3)
    (unassigned d4) (unassigned d5) (unassigned d6)
    (unassigned d7) (unassigned d8) (unassigned d9)

    ; Flight graph (symmetric/direct)
    (direct prague vienna) (direct vienna prague)
    (direct vienna porto)  (direct porto vienna)

    ; Initial counts: zero for each city
    (count-prague-0) (count-vienna-0) (count-porto-0)
  )

  (:goal (and
    ; Every day assigned to exactly one city (the assigned facts below enforce exact mapping)
    (assigned d1 prague)
    (assigned d2 prague)
    (assigned d3 prague)
    (assigned d4 vienna)
    (assigned d5 vienna)
    (assigned d6 vienna)
    (assigned d7 porto)
    (assigned d8 porto)
    (assigned d9 porto)

    ; Numeric counts reached exactly 3 for each city (encoded as predicates)
    (count-prague-3)
    (count-vienna-3)
    (count-porto-3)

    ; Final location matches day9 = Porto
    (last-is-porto)
  ))
)