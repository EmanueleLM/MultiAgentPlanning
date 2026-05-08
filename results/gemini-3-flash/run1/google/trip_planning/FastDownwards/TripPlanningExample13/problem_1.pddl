(define (problem trip_planning_example_13)
  (:domain trip_planning)
  (:objects
    manchester bucharest lyon - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 - day
    c0 c1 c2 c3 c4 c5 c6 c7 - count
  )
  (:init
    (not_started)
    (next_day d0 d1) (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5) (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9) (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13) (next_day d13 d14) (next_day d14 d15) (next_day d15 d16) (next_day d16 d17)
    (next_val c0 c1) (next_val c1 c2) (next_val c2 c3) (next_val c3 c4) (next_val c4 c5) (next_val c5 c6) (next_val c6 c7)
    (flight manchester bucharest) (flight bucharest manchester)
    (flight bucharest lyon) (flight lyon bucharest)
    (count manchester c0) (count bucharest c0) (count lyon c0)
  )
  (:goal (and
    (current_day d17)
    (count manchester c7)
    (count bucharest c7)
    (count lyon c5)
    (visited_on lyon d13)
    (visited_on lyon d14)
    (visited_on lyon d15)
    (visited_on lyon d16)
    (visited_on lyon d17)
  ))
)