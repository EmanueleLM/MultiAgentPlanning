(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    lyon frankfurt krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 - count
  )
  (:init
    (not_started)
    (is_day_1 d1)
    (is_count_0 n0)

    ;; Starting counts for all cities
    (city_count lyon n0)
    (city_count frankfurt n0)
    (city_count krakow n0)
    
    ;; Linear temporal progression
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    
    ;; Numerical counting progression
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)
    (next_count n5 n6)
    (next_count n6 n7)
    (next_count n7 n8)
    (next_count n8 n9)
    (next_count n9 n10)
    (next_count n10 n11)
    (next_count n11 n12)
    
    ;; Available direct flight connections
    (can_fly lyon frankfurt)
    (can_fly frankfurt lyon)
    (can_fly frankfurt krakow)
    (can_fly krakow frankfurt)
  )
  (:goal
    (and
      ;; Total duration constraints
      (city_count lyon n7)
      (city_count frankfurt n2)
      (city_count krakow n3)
      
      ;; Specific temporal show constraint
      (at krakow d8)
      (at krakow d9)
      (at krakow d10)
    )
  )
)