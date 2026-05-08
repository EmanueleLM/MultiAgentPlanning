(define (problem trip_plan_10_days)
  (:domain trip_planning_example_21)
  (:objects
    mykonos vienna venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )
  (:init
    (at mykonos)
    (current_day d1)
    (visited mykonos d1)
    
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    
    (can_fly mykonos vienna)
    (can_fly vienna mykonos)
    (can_fly vienna venice)
    (can_fly venice vienna)
  )
  (:goal
    (and
      ;; 2 days in Mykonos
      (visited mykonos d1)
      (visited mykonos d2)
      
      ;; 4 days in Vienna
      (visited vienna d2)
      (visited vienna d3)
      (visited vienna d4)
      (visited vienna d5)
      
      ;; 6 days in Venice (also satisfies the Workshop Day 5-10)
      (visited venice d5)
      (visited venice d6)
      (visited venice d7)
      (visited venice d8)
      (visited venice d9)
      (visited venice d10)
      
      ;; Final location must be Venice
      (at venice)
      (current_day d10)
    )
  )
)