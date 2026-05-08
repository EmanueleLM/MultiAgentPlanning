(define (problem trip_planning_example_32_problem)
  (:domain trip_planning_example_32)
  (:objects
    reykjavik riga paris - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - count
  )
  (:init
    (not_started)
    (is_day_1 d1)
    
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    
    (succ n0 n1)
    (succ n1 n2)
    (succ n2 n3)
    (succ n3 n4)
    (succ n4 n5)
    (succ n5 n6)
    (succ n6 n7)
    (succ n7 n8)
    (succ n8 n9)
    (succ n9 n10)
    
    (flight paris reykjavik)
    (flight reykjavik paris)
    (flight riga paris)
    (flight paris riga)
    
    (visited_count reykjavik n0)
    (visited_count riga n0)
    (visited_count paris n0)
  )
  (:goal
    (and
      (visited_count reykjavik n5)
      (visited_count riga n3)
      (visited_count paris n4)
      (at_city_day reykjavik d6)
      (at_city_day reykjavik d7)
      (at_city_day reykjavik d8)
      (at_city_day reykjavik d9)
      (at_city_day reykjavik d10)
    )
  )
)