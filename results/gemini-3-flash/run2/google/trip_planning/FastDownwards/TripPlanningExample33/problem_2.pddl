(define (problem trip_planning_example_33)
  (:domain trip_planning)
  (:objects
    rome barcelona krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 - count
  )
  (:init
    ;; Initial location and visits
    (at_city rome d1)
    (visited rome d1)
    
    ;; Initial city counts
    (city_count rome n1)
    (city_count barcelona n0)
    (city_count krakow n0)
    
    ;; Day sequence
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
    
    ;; Count sequence
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
    (next_count n12 n13)
    
    ;; Flight network
    (can_fly rome barcelona)
    (can_fly barcelona rome)
    (can_fly barcelona krakow)
    (can_fly krakow barcelona)
  )
  (:goal
    (and
      ;; Duration requirements
      (city_count rome n4)
      (city_count barcelona n7)
      (city_count krakow n4)
      
      ;; Friend meeting requirements (Krakow between Day 10 and 13)
      (visited krakow d10)
      (visited krakow d11)
      (visited krakow d12)
      (visited krakow d13)
      
      ;; Final trip day reached
      (at_city krakow d13)
    )
  )
)