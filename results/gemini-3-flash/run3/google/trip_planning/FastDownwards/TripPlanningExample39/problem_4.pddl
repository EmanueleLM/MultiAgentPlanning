(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
    c0 c1 c2 c3 c4 c5 c6 c7 - count
  )
  (:init
    ;; Starting position and time
    (at_city porto)
    (current_day d1)
    
    ;; Initial stay counts
    (spent_count porto c0)
    (spent_count barcelona c0)
    (spent_count florence c0)
    
    ;; Flights (bi-directional as implied by Porto and Barcelona, Barcelona and Florence)
    (can_fly porto barcelona)
    (can_fly barcelona porto)
    (can_fly barcelona florence)
    (can_fly florence barcelona)
    
    ;; Day progression
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
    
    ;; Count progression
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    (next_count c6 c7)
    
    ;; Window for visiting relatives in Porto
    (is_relative_day d1)
    (is_relative_day d2)
    (is_relative_day d3)
  )
  (:goal
    (and
      ;; Hard constraints: visit durations and specific activities
      (relatives_visited)
      (spent_count porto c3)
      (spent_count barcelona c7)
      (spent_count florence c4)
      ;; Total trip is for 12 days; any plan satisfying counts within the d1-d13 range
      ;; implicitly uses a maximum of 12 full stay days.
    )
  )
)