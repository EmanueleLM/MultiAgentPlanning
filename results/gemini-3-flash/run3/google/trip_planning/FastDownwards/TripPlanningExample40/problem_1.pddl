(define (problem trip_planning_example_40_prob)
    (:domain trip_planning_example_40)
    (:objects
      manchester oslo reykjavik - city
      d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
      n0 n1 n2 n3 n4 n5 n6 - count
    )
    (:init
      ;; Start in Manchester on Day 1
      (at manchester)
      (current_day d1)
      
      ;; Initial visit counts are zero
      (count manchester n0)
      (count oslo n0)
      (count reykjavik n0)

      ;; Day sequence (8 days total means we reach day 9)
      (next_day d1 d2)
      (next_day d2 d3)
      (next_day d3 d4)
      (next_day d4 d5)
      (next_day d5 d6)
      (next_day d6 d7)
      (next_day d7 d8)
      (next_day d8 d9)

      ;; Count sequence
      (next_count n0 n1)
      (next_count n1 n2)
      (next_count n2 n3)
      (next_count n3 n4)
      (next_count n4 n5)
      (next_count n5 n6)

      ;; Flight connections
      (can_fly oslo reykjavik)
      (can_fly reykjavik oslo)
      (can_fly manchester oslo)
      (can_fly oslo manchester)
    )
    (:goal
      (and
        ;; Completed 8 days
        (current_day d9)
        
        ;; Manchester: 2 days, including wedding on Day 1 and Day 2
        (count manchester n2)
        (visited manchester d1)
        (visited manchester d2)
        
        ;; Oslo: 6 days
        (count oslo n6)
        
        ;; Reykjavik: 2 days
        (count reykjavik n2)
      )
    )
  )