(define (problem trip_planning_example_25)
  (:domain trip_planning)
  (:objects
    valencia lyon split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 - day
    c0 c1 c2 c3 c4 c5 c6 c7 - count
  )
  (:init
    ;; Starting point
    (at valencia)
    (current_day d1)
    
    ;; Initial city counts
    (city_count valencia c0)
    (city_count lyon c0)
    (city_count split c0)
    
    ;; Day ordering
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
    (next_day d13 d14) (next_day d14 d15) (next_day d15 d16) (next_day d16 d17)
    
    ;; Count ordering
    (next_count c0 c1) (next_count c1 c2) (next_count c2 c3) (next_count c3 c4)
    (next_count c4 c5) (next_count c5 c6) (next_count c6 c7)
    
    ;; Direct flight network
    (can_fly lyon split) (can_fly split lyon)
    (can_fly valencia lyon) (can_fly lyon valencia)
  )
  (:goal
    (and
      ;; Total trip duration (16 full days spent)
      (current_day d17)
      
      ;; City stay durations
      (city_count valencia c5)
      (city_count lyon c6)
      (city_count split c7)
      
      ;; Show attendance constraint in Split
      (visited split d10)
      (visited split d11)
      (visited split d12)
      (visited split d13)
      (visited split d14)
      (visited split d15)
      (visited split d16)
    )
  )
)