(define (problem trip_example_p48)
  (:domain trip_planning)
  (:objects
    split manchester geneva - city
    day1 day2 day3 day4 day5 - day
    c0 c1 c2 c3 c4 - count
  )

  (:init
    ;; Starting day
    (current_day day1)
    
    ;; Temporal sequence for 4 days (trip concludes when current_day is day5)
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    
    ;; Count tracking for durations
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    
    ;; Initial stay counts
    (stay_count split c0)
    (stay_count manchester c0)
    (stay_count geneva c0)
    
    ;; Direct flights
    ;; Split and Geneva (bi-directional)
    (can_fly split geneva)
    (can_fly geneva split)
    ;; from Manchester to Split (uni-directional)
    (can_fly manchester split)
    ;; Manchester and Geneva (bi-directional)
    (can_fly manchester geneva)
    (can_fly geneva manchester)
  )

  (:goal
    (and
      ;; The trip must last 4 days total
      (current_day day5)
      
      ;; Stay requirements (Note: Total of 6 days requested across 4 available slots)
      (stay_count split c2)
      (stay_count manchester c2)
      (stay_count geneva c2)
      
      ;; Friend constraint: stay in Split on day 2 and day 3
      (visited_at split day2)
      (visited_at split day3)
    )
  )
)