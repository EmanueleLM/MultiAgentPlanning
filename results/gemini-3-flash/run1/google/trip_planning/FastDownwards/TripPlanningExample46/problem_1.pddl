(define (problem trip_planning_example_46_problem)
  (:domain trip_planning_example_46)
  (:objects
    seville manchester stockholm - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    n0 n1 n2 n3 n4 n5 - count
  )
  (:init
    ;; Starting location and day
    (at stockholm)
    (current_day d1)
    
    ;; Initial stay counts (Day 1 is already visited in Stockholm)
    (visited stockholm d1)
    (stay_count stockholm n1)
    (stay_count manchester n0)
    (stay_count seville n0)
    
    ;; Day sequence for the 11-day trip
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11)
    
    ;; Count sequence up to the maximum required stay (5 days)
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)
    
    ;; Flight connectivity: Stockholm <-> Manchester <-> Seville
    (flight manchester seville)
    (flight seville manchester)
    (flight stockholm manchester)
    (flight manchester stockholm)
  )
  (:goal (and
    ;; Required stay durations (3+5+5=13 days in a 11-day trip, requiring overlaps)
    (stay_count stockholm n3)
    (stay_count manchester n5)
    (stay_count seville n5)
    
    ;; Conference requirements (Must be in Stockholm on Day 1 and Day 3)
    ;; Day 1 is satisfied in the initial state.
    (visited stockholm d3)
    
    ;; Ensure the entire 11-day period is planned
    (current_day d11)
  ))
)