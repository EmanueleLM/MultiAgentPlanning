(define (problem trip_planning_example_19)
  (:domain trip_planning)
  (:objects
    brussels valencia nice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    c0 c1 c2 c3 c4 c5 c6 - count
  )
  (:init
    (current_day d1)
    (is_start_day d1)
    
    (count_city brussels c0)
    (count_city valencia c0)
    (count_city nice c0)
    
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    
    (can_fly brussels valencia)
    (can_fly valencia brussels)
    (can_fly brussels nice)
    (can_fly nice brussels)
  )
  (:goal
    (and
      (count_city brussels c2)
      (count_city valencia c3)
      (count_city nice c6)
      (visited_at nice d1)
      (visited_at nice d2)
      (visited_at nice d3)
      (visited_at nice d4)
      (visited_at nice d5)
      (visited_at nice d6)
      (current_day d10)
    )
  )
)