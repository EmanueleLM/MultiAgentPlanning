(define (problem trip_planning_example_19)
  (:domain trip_planning)
  (:objects
    brussels valencia nice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    c0 c1 c2 c3 c4 c5 c6 - count
  )
  (:init
    (not_started)
    (current_day d1)
    
    (day_count brussels c0)
    (day_count valencia c0)
    (day_count nice c0)
    
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
    (can_fly nice brussels)
    (can_fly brussels nice)
  )
  (:goal
    (and
      ;; The trip must finish the 9th day
      (current_day d10)
      
      ;; Stay duration requirements
      (day_count brussels c2)
      (day_count valencia c3)
      (day_count nice c6)
      
      ;; Meeting friends at Nice between day 1 and day 6
      (visited nice d1)
      (visited nice d2)
      (visited nice d3)
      (visited nice d4)
      (visited nice d5)
      (visited nice d6)
    )
  )
)