(define (problem trip_planning_example_45)
  (:domain trip_planning)
  (:objects
    copenhagen lisbon florence - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
    s0 s1 s2 s3 s4 s5 s6 s7 - step
  )
  (:init
    (at copenhagen)
    (current_day d1)
    (at_city_day copenhagen d1)
    (count copenhagen s1)
    (count lisbon s0)
    (count florence s0)
    
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
    (next_day d13 d14) (next_day d14 d15) (next_day d15 d16)
    
    (next_step s0 s1) (next_step s1 s2) (next_step s2 s3) (next_step s3 s4)
    (next_step s4 s5) (next_step s5 s6) (next_step s6 s7)
    
    (can_fly copenhagen lisbon)
    (can_fly lisbon copenhagen)
    (can_fly lisbon florence)
    (can_fly florence lisbon)
  )
  (:goal (and
    (at_city_day copenhagen d1)
    (at_city_day copenhagen d7)
    (count copenhagen s7)
    (count lisbon s7)
    (count florence s4)
    (current_day d16)
  ))
)