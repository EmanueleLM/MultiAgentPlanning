(define (problem trip_planning_example_37)
  (:domain trip_planning)
  (:objects
    reykjavik milan porto - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    c0 c1 c2 c3 c4 c5 c6 - count
  )
  (:init
    (not_started)
    (current_day d1)
    (visit_count reykjavik c0)
    (visit_count milan c0)
    (visit_count porto c0)
    
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
    
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    
    (can_fly reykjavik milan)
    (can_fly milan reykjavik)
    (can_fly milan porto)
    (can_fly porto milan)
  )
  (:goal
    (and
      (visit_count reykjavik c6)
      (visit_count porto c2)
      (visit_count milan c4)
      (visited porto d9)
      (visited porto d10)
      (current_day d11)
    )
  )
)