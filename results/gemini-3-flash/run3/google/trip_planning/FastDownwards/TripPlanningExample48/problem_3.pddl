(define (problem trip_example_p48)
  (:domain trip_planning)
  (:objects
    split manchester geneva - city
    d1 d2 d3 d4 d5 - day
    c0 c1 c2 c3 c4 - count
  )

  (:init
    ;; Starting state: The person begins at Manchester at the start of Day 1.
    (at_city manchester)
    (day_is d1)

    ;; Temporal structure: 4 days total (trip ends at the transition to Day 5).
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)

    ;; Numerical structure: Counts for city stay durations.
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)

    ;; Initial stay counts for all cities are zero.
    (stay_count split c0)
    (stay_count manchester c0)
    (stay_count geneva c0)

    ;; Direct flight availability:
    ;; Split and Geneva (bi-directional)
    (can_fly split geneva)
    (can_fly geneva split)
    ;; From Manchester to Split (uni-directional)
    (can_fly manchester split)
    ;; Manchester and Geneva (bi-directional)
    (can_fly manchester geneva)
    (can_fly geneva manchester)
  )

  (:goal
    (and
      ;; The trip must conclude after 4 days.
      (day_is d5)

      ;; Requirement: Visit Split for 2 days.
      (stay_count split c2)
      ;; Requirement: Stay in Manchester for 2 days.
      (stay_count manchester c2)
      ;; Requirement: Visit Geneva for 2 days.
      (stay_count geneva c2)

      ;; Constraint: Meet a friend in Split between Day 2 and Day 3.
      ;; This is modeled as being in Split on both Day 2 and Day 3.
      (visited_at split d2)
      (visited_at split d3)
    )
  )
)