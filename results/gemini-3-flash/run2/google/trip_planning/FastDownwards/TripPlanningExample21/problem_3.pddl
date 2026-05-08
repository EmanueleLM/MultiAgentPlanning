(define (problem trip_planning_example_21)
  (:domain trip_planning)
  (:objects
    mykonos vienna venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    n0 n1 n2 n3 n4 n5 n6 - count
  )
  (:init
    (is_first_day d1)
    
    ;; Day sequence
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9) (next_day d9 d10)
    
    ;; Count sequence
    (next_count n0 n1) (next_count n1 n2) (next_count n2 n3) (next_count n3 n4)
    (next_count n4 n5) (next_count n5 n6)
    
    ;; Initial stay counts
    (city_count mykonos n0)
    (city_count vienna n0)
    (city_count venice n0)
    
    ;; Flight connectivity
    (can_fly mykonos vienna) (can_fly vienna mykonos)
    (can_fly vienna venice) (can_fly venice vienna)
  )
  (:goal
    (and
      ;; Total days for each city
      (city_count mykonos n2)
      (city_count vienna n4)
      (city_count venice n6)
      
      ;; Workshop requirement in Venice (Days 5 to 10)
      (visited venice d5)
      (visited venice d6)
      (visited venice d7)
      (visited venice d8)
      (visited venice d9)
      (visited venice d10)
    )
  )
)