(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects 
    rome barcelona krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
    n0 n1 n2 n3 n4 n5 n6 n7 - step
  )
  (:init
    (not_started)
    (is_day1 d1)
    (count rome n0)
    (count barcelona n0)
    (count krakow n0)
    
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
    
    (next_step n0 n1)
    (next_step n1 n2)
    (next_step n2 n3)
    (next_step n3 n4)
    (next_step n4 n5)
    (next_step n5 n6)
    (next_step n6 n7)
    
    (flight rome barcelona)
    (flight barcelona rome)
    (flight barcelona krakow)
    (flight krakow barcelona)
  )
  (:goal
    (and
      (count rome n4)
      (count barcelona n7)
      (count krakow n4)
      (visited krakow d10)
      (visited krakow d11)
      (visited krakow d12)
      (visited krakow d13)
    )
  )
)