(define (problem trip_planning_example_7)
  (:domain trip_planning)
  (:objects
    dubrovnik istanbul venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
    c0 c1 c2 c3 c4 c5 c6 - count
  )
  (:init
    ;; Starting point
    (at dubrovnik)
    (current_day d1)

    ;; Stay counters initialized to zero
    (stay_count dubrovnik c0)
    (stay_count istanbul c0)
    (stay_count venice c0)

    ;; Temporal succession (11 days of travel mean we move from d1 up to d12)
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

    ;; Numeric succession for stay requirements
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)

    ;; Direct flight routes
    (flight dubrovnik istanbul)
    (flight istanbul venice)
  )
  (:goal
    (and
      ;; Total duration check (11 days completed)
      (current_day d12)
      ;; Individual stay requirements
      (stay_count dubrovnik c4)
      (stay_count istanbul c3)
      (stay_count venice c6)
    )
  )
)