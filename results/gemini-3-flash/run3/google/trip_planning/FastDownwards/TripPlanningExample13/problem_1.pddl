(define (problem trip_planning_example_13_prob)
  (:domain trip_planning_example_13)
  (:objects
    manchester bucharest lyon - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 d18 - day
    c0 c1 c2 c3 c4 c5 c6 c7 - count_val
  )
  (:init
    (at manchester)
    (day_at d1)
    (count manchester c0)
    (count bucharest c0)
    (count lyon c0)
    
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
    (next_day d13 d14) (next_day d14 d15) (next_day d15 d16) (next_day d16 d17)
    (next_day d17 d18)
    
    (next_count c0 c1) (next_count c1 c2) (next_count c2 c3) (next_count c3 c4)
    (next_count c4 c5) (next_count c5 c6) (next_count c6 c7)
    
    (flight manchester bucharest)
    (flight bucharest manchester)
    (flight bucharest lyon)
    (flight lyon bucharest)
  )
  (:goal (and
    (day_at d18)
    (count manchester c7)
    (count bucharest c7)
    (count lyon c5)
    (visited lyon d13)
    (visited lyon d14)
    (visited lyon d15)
    (visited lyon d16)
    (visited lyon d17)
  ))
)