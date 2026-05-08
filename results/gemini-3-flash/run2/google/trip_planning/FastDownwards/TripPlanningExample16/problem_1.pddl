(define (problem trip_planning_example_16)
  (:domain trip_planning)
  (:objects
    prague vienna porto - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    c0 c1 c2 c3 c4 c5 - count
  )
  (:init
    ;; Starting location and day
    (at_city prague)
    (current_day d1)

    ;; Initial counts: Prague starts with 1 day (Day 1), others with 0.
    (has_count prague c1)
    (has_count vienna c0)
    (has_count porto c0)
    (visited prague d1)

    ;; Temporal adjacency
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)

    ;; Numerical successors for counters
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)

    ;; Flight connectivity
    (can_fly prague vienna)
    (can_fly vienna prague)
    (can_fly vienna porto)
    (can_fly porto vienna)
  )
  (:goal
    (and
      ;; Total trip duration constraint
      (current_day d9)

      ;; City stay duration constraints
      (has_count prague c3)
      (has_count vienna c3)
      (has_count porto c5)

      ;; Workshop constraints in Prague (Day 1 to Day 3)
      (visited prague d1)
      (visited prague d2)
      (visited prague d3)
    )
  )
)