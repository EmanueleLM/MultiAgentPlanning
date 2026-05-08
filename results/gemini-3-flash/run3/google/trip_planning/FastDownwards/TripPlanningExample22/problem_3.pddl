(define (problem trip_planning_example_22)
  (:domain trip_planning)
  (:objects
    berlin frankfurt bucharest - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 - visit_count
  )
  (:init
    (at berlin)
    (current_day d1)
    (visited berlin d1)
    (count_at berlin v1)
    (count_at frankfurt v0)
    (count_at bucharest v0)
    
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11)
    
    (next_count v0 v1) (next_count v1 v2) (next_count v2 v3) (next_count v3 v4)
    (next_count v4 v5) (next_count v5 v6) (next_count v6 v7) (next_count v7 v8)
    (next_count v8 v9) (next_count v9 v10) (next_count v10 v11)
    
    (connected berlin frankfurt)
    (connected frankfurt berlin)
    (connected frankfurt bucharest)
    (connected bucharest frankfurt)
  )
  (:goal (and
    (count_at berlin v7)
    (count_at frankfurt v4)
    (count_at bucharest v2)
    (visited berlin d1)
    (visited berlin d2)
    (visited berlin d3)
    (visited berlin d4)
    (visited berlin d5)
    (visited berlin d6)
    (visited berlin d7)
  ))
)