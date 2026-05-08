(define (problem trip_planning_46)
  (:domain trip_planning_example_46)
  (:objects
    seville manchester stockholm - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
    c0 c1 c2 c3 c4 c5 - count
  )

  (:init
    ;; Starting location: Stockholm
    (at stockholm)
    (current_day d1)

    ;; Initialize visit counts
    (visit_count seville c0)
    (visit_count manchester c0)
    (visit_count stockholm c0)

    ;; Day transitions (for 11 days of activity, we need to reach d12)
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11) (next_day d11 d12)

    ;; Count increments
    (next_count c0 c1) (next_count c1 c2) (next_count c2 c3)
    (next_count c3 c4) (next_count c4 c5)

    ;; Flight connections (Symmetric based on "Manchester and Seville, Stockholm and Manchester")
    (flight manchester seville) (flight seville manchester)
    (flight stockholm manchester) (flight manchester stockholm)
  )

  (:goal
    (and
      ;; Total trip length finished (11 days of activities)
      (current_day d12)

      ;; Exact city stay requirements
      (visit_count seville c5)
      (visit_count manchester c5)
      (visit_count stockholm c3)

      ;; Conference requirements in Stockholm
      (visited_at stockholm d1)
      (visited_at stockholm d3)
    )
  )
)