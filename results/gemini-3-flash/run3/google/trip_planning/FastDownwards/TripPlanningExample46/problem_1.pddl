(define (problem trip_planning_46)
  (:domain trip_planning_example_46)
  (:objects
    seville manchester stockholm - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 - count
  )

  (:init
    ;; Starting point
    (current_day d1)
    (at stockholm d1)
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

    ;; Flight connections
    (flight manchester seville) (flight seville manchester)
    (flight stockholm manchester) (flight manchester stockholm)

    ;; Conference and general feasibility constraints
    ;; Day 1: Already at Stockholm (Conference)
    ;; Day 2: Free choice
    (can_be_at stockholm d2) (can_be_at manchester d2) (can_be_at seville d2)
    ;; Day 3: Stockholm Conference
    (can_be_at stockholm d3)
    ;; Days 4-11: Free choice
    (can_be_at stockholm d4) (can_be_at manchester d4) (can_be_at seville d4)
    (can_be_at stockholm d5) (can_be_at manchester d5) (can_be_at seville d5)
    (can_be_at stockholm d6) (can_be_at manchester d6) (can_be_at seville d6)
    (can_be_at stockholm d7) (can_be_at manchester d7) (can_be_at seville d7)
    (can_be_at stockholm d8) (can_be_at manchester d8) (can_be_at seville d8)
    (can_be_at stockholm d9) (can_be_at manchester d9) (can_be_at seville d9)
    (can_be_at stockholm d10) (can_be_at manchester d10) (can_be_at seville d10)
    (can_be_at stockholm d11) (can_be_at manchester d11) (can_be_at seville d11)
  )

  (:goal
    (and
      ;; Complete the 11-day trip
      (current_day d11)
      ;; Specific city stay requirements
      (visit_count seville c5)
      (visit_count manchester c5)
      (visit_count stockholm c3)
      ;; Explicit conference check for Day 3
      (at stockholm d3)
    )
  )
)