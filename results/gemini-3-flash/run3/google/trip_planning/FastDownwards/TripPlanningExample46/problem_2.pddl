(define (problem trip_planning_46)
  (:domain trip_planning_example_46)
  (:objects
    seville manchester stockholm - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 - count
  )

  (:init
    ;; Starting point: Stockholm on Day 1
    (current_day d1)
    (at stockholm)
    (at_day stockholm d1)
    (visit_count stockholm c1)
    (visit_count manchester c0)
    (visit_count seville c0)

    ;; Day transitions
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11)

    ;; Count increments
    (next_count c0 c1) (next_count c1 c2) (next_count c2 c3) (next_count c3 c4)
    (next_count c4 c5) (next_count c5 c6) (next_count c6 c7) (next_count c7 c8)
    (next_count c8 c9) (next_count c9 c10) (next_count c10 c11)

    ;; Flight connections (Symmetric)
    (flight manchester seville) (flight seville manchester)
    (flight stockholm manchester) (flight manchester stockholm)
  )

  (:goal
    (and
      ;; Total trip length
      (current_day d11)

      ;; City stay requirements
      (visit_count seville c5)
      (visit_count manchester c5)
      (visit_count stockholm c3)

      ;; Conference requirement for Day 3
      (at_day stockholm d3)
    )
  )
)