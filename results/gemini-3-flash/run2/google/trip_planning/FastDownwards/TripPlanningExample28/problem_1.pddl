(define (problem trip_planning_problem_28)
  (:domain trip_planning_example_28)
  (:objects
    venice zurich florence - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 - count
  )

  (:init
    ;; Starting point
    (at venice d1)

    ;; Initialize visit counts
    (visited_count venice c0)
    (visited_count zurich c0)
    (visited_count florence c0)

    ;; Flight connectivity
    ;; Venice and Zurich have direct flights (bidirectional)
    (flight venice zurich)
    (flight zurich venice)
    ;; From Zurich to Florence (unidirectional)
    (flight zurich florence)

    ;; Temporal sequence (12 days total, mapping to 12 transitions)
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    (next_day d10 d11)
    (next_day d11 d12)
    (next_day d12 d13)

    ;; Count sequence
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    (next_count c6 c7)
    (next_count c7 c8)
    (next_count c8 c9)
    (next_count c9 c10)
    (next_count c10 c11)
    (next_count c11 c12)
  )

  (:goal
    (and
      ;; Requirements: 6 days in Venice, 6 days in Florence, 2 days in Zurich
      (visited_count venice c6)
      (visited_count florence c6)
      (visited_count zurich c2)
    )
  )
)