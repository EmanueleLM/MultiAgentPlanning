(define (problem trip_instance)
  (:domain trip_planning)
  (:objects
    paris istanbul salzburg - city
    d1 d2 d3 d4 d5 d6 d7 d8 - day
  )

  (:init
    (at paris)
    (current_day d1)
    
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    
    (day_less d1 d2) (day_less d1 d3) (day_less d1 d4) (day_less d1 d5) (day_less d1 d6) (day_less d1 d7) (day_less d1 d8)
    (day_less d2 d3) (day_less d2 d4) (day_less d2 d5) (day_less d2 d6) (day_less d2 d7) (day_less d2 d8)
    (day_less d3 d4) (day_less d3 d5) (day_less d3 d6) (day_less d3 d7) (day_less d3 d8)
    (day_less d4 d5) (day_less d4 d6) (day_less d4 d7) (day_less d4 d8)
    (day_less d5 d6) (day_less d5 d7) (day_less d5 d8)
    (day_less d6 d7) (day_less d6 d8)
    (day_less d7 d8)
    
    (direct_flight paris istanbul)
    (direct_flight istanbul paris)
    (direct_flight istanbul salzburg)
    (direct_flight salzburg istanbul)
  )

  (:goal (and
    (current_day d8)
    (visited paris d1)
    (visited paris d2)
    (istanbul_ok)
    (salzburg_ok)
  ))
)