(define (problem trip_planning_example_10_problem)
  (:domain trip_planning_example_10)
  (:objects
    oslo dublin valencia - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 - count
  )
  (:init
    ;; Time and location
    (current_day d1)
    (at oslo d1)

    ;; Stay counters
    (count_at oslo c0)
    (count_at dublin c0)
    (count_at valencia c0)

    ;; Connectivity
    (flight oslo dublin)
    (flight dublin oslo)
    (flight dublin valencia)
    (flight valencia dublin)

    ;; Day progression
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)

    ;; Count progression
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    (next_count c6 c7)
    (next_count c7 c8)
    (next_count c8 c9)
  )
  (:goal
    (and
      ;; Spend 3 days in Oslo
      (count_at oslo c3)
      
      ;; Spend 3 days in Dublin
      (count_at dublin c3)
      
      ;; Spend 5 days in Valencia
      (count_at valencia c5)
      
      ;; Visit relatives in Valencia between day 5 and day 9
      (already_counted valencia d5)
      (already_counted valencia d6)
      (already_counted valencia d7)
      (already_counted valencia d8)
      (already_counted valencia d9)
    )
  )
)