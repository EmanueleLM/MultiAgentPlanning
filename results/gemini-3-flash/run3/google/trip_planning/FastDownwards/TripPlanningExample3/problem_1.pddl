(define (problem trip_planning_example_3)
  (:domain trip_planning)
  (:objects
    d0 d1 d2 d3 d4 d5 d6 - day
    n0 n1 n2 n3 n4 n5 n6 - count
  )
  (:init
    ;; Time flow
    (current_day d0)
    (next_day d0 d1)
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)

    ;; City counting (up to max possible days)
    (berlin_count n0)
    (warsaw_count n0)
    (bucharest_count n0)
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)
    (next_count n5 n6)
    
    ;; Self-loops for count saturation (allows staying longer than goal requirement)
    (next_count n1 n1)
    (next_count n2 n2)
    (next_count n3 n3)
    (next_count n4 n4)
    (next_count n5 n5)
    (next_count n6 n6)

    ;; Flights as per specification (assumed bidirectional)
    (can_fly berlin warsaw)
    (can_fly warsaw berlin)
    (can_fly warsaw bucharest)
    (can_fly bucharest warsaw)
  )
  (:goal
    (and
      ;; Visit requirements
      (berlin_count n3)
      (warsaw_count n3)
      (bucharest_count n2)
      
      ;; Friend meeting requirement (Bucharest Day 5-6)
      (at_at_day bucharest d5)
      (at_at_day bucharest d6)
      
      ;; Complete the 6-day itinerary
      (current_day d6)
    )
  )
)