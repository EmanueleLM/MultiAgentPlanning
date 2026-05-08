(define (problem trip_planning_example_33)
  (:domain trip_planning)
  (:objects
    rome barcelona krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 - count
  )
  (:init
    ;; Starting point
    (at_city rome d1)
    
    ;; Initial stay durations (in nights)
    (spent_nights rome n0)
    (spent_nights barcelona n0)
    (spent_nights krakow n0)
    
    ;; Timeline
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
    
    ;; Counting sequence
    (increment n0 n1)
    (increment n1 n2)
    (increment n2 n3)
    (increment n3 n4)
    (increment n4 n5)
    (increment n5 n6)
    (increment n6 n7)
    (increment n7 n8)
    (increment n8 n9)
    (increment n9 n10)
    (increment n10 n11)
    (increment n11 n12)
    
    ;; Flight connections
    (can_fly barcelona krakow)
    (can_fly krakow barcelona)
    (can_fly rome barcelona)
    (can_fly barcelona rome)
  )
  (:goal
    (and
      ;; 4 days in Rome (requires 3 transitions)
      (spent_nights rome n3)
      
      ;; 7 days in Barcelona (requires 6 transitions)
      (spent_nights barcelona n6)
      
      ;; 4 days in Krakow (requires 3 transitions)
      (spent_nights krakow n3)
      
      ;; Meet a friend in Krakow between day 10 and day 13
      (at_city krakow d10)
      (at_city krakow d11)
      (at_city krakow d12)
      (at_city krakow d13)
    )
  )
)