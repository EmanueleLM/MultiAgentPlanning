(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
    c0 c1 c2 c3 c4 c5 c6 c7 - count
  )
  (:init
    ;; Starting in Porto on Day 1
    (at_city porto)
    (current_day d1)
    
    ;; Initializing stay counters for each city at 0
    (spent_count porto c0)
    (spent_count barcelona c0)
    (spent_count florence c0)
    
    ;; Relative visit validity window (between day 1 and day 3)
    (is_valid_relative_day d1)
    (is_valid_relative_day d2)
    (is_valid_relative_day d3)
    
    ;; Temporal sequence definition
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
    (next_day d13 d14)
    (next_day d14 d15)
    
    ;; Numeric increment definition for stay counters
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    (next_count c6 c7)
    
    ;; Direct flight network connections
    (can_fly porto barcelona)
    (can_fly barcelona porto)
    (can_fly barcelona florence)
    (can_fly florence barcelona)
  )
  (:goal
    (and
      ;; Spent 3 days in Porto
      (spent_count porto c3)
      ;; Spent 7 days in Barcelona
      (spent_count barcelona c7)
      ;; Spent 4 days in Florence
      (spent_count florence c4)
      ;; Relatives in Porto have been visited
      (relatives_visited)
    )
  )
)