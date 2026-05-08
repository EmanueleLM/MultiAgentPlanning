(define (problem trip_planning_example_16_problem)
  (:domain trip_planning_example_16)
  (:objects
    prague vienna porto - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    c0 c1 c2 c3 c4 c5 - count
  )

  (:init
    ;; Starting location and day
    (at prague d1)
    (visited prague d1)

    ;; Initial stay counts
    (stay_count prague c1)
    (stay_count vienna c0)
    (stay_count porto c0)

    ;; Temporal sequence
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)

    ;; Count sequence
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)

    ;; Flight connections
    (flight vienna porto)
    (flight porto vienna)
    (flight prague vienna)
    (flight vienna prague)
  )

  (:goal
    (and
      ;; Workshop in Prague Day 1-3
      (visited prague d1)
      (visited prague d2)
      (visited prague d3)

      ;; Total stay requirements
      (stay_count prague c3)
      (stay_count vienna c3)
      (stay_count porto c5)
    )
  )
)