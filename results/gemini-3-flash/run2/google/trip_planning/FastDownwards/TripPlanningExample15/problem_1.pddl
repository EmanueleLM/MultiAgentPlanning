(define (problem trip_planning_example_15)
  (:domain trip_planning)
  (:objects
    berlin porto krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    v0 v1 v2 v3 v4 v5 v6 - value
  )

  (:init
    (at_city krakow)
    (current_day d1)
    
    (count berlin v0)
    (count porto v0)
    (count krakow v0)
    
    (next_val v0 v1)
    (next_val v1 v2)
    (next_val v2 v3)
    (next_val v3 v4)
    (next_val v4 v5)
    (next_val v5 v6)
    
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
    
    (flight berlin porto)
    (flight porto berlin)
    (flight krakow berlin)
    (flight berlin krakow)
  )

  (:goal (and
    (count berlin v6)
    (count porto v2)
    (count krakow v5)
    (city_visited_day porto d10)
    (city_visited_day porto d11)
    (current_day d11)
  ))
)