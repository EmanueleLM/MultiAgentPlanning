(define (problem trip_example)
  (:domain trip_planning)
  (:objects
    venice dublin porto - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - count
  )
  (:init
    ;; Starting position and time
    (at venice)
    (current_day d1)
    
    ;; Initial visit counts
    ;; Since we start in Venice on day 1, it's our first day there.
    (spent venice n1)
    (spent dublin n0)
    (spent porto n0)
    
    ;; Initial visit history
    (visited venice d1)
    
    ;; Temporal ordering
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)
    (next d9 d10)
    
    ;; Count ordering
    (next_count n0 n1) (next_count n1 n2) (next_count n2 n3) (next_count n3 n4)
    (next_count n4 n5) (next_count n5 n6) (next_count n6 n7) (next_count n7 n8)
    (next_count n8 n9) (next_count n9 n10)
    
    ;; City connections (bi-directional as per convention)
    (connected dublin porto)
    (connected porto dublin)
    (connected venice dublin)
    (connected dublin venice)
  )
  (:goal
    (and
      ;; 4 days in Venice
      (spent venice n4)
      ;; Friends in Venice between Day 1 and Day 4
      (visited venice d1)
      (visited venice d2)
      (visited venice d3)
      (visited venice d4)
      
      ;; 4 days in Dublin
      (spent dublin n4)
      
      ;; 4 days in Porto
      (spent porto n4)
      
      ;; End of the 10-day trip
      (current_day d10)
    )
  )
)