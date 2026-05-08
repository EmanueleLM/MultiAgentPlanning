(define (problem trip_example_p48)
  (:domain trip_planning)
  (:objects
    split manchester geneva - city
    day1 day2 day3 day4 day5 - day
    c0 c1 c2 - count
  )

  (:init
    ;; Starting state
    (on_day day1)
    
    ;; Temporal structure: 4 days total (Day 5 marks the end of the 4th day)
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    
    ;; Count structure for duration tracking
    (next_count c0 c1)
    (next_count c1 c2)
    
    ;; Initial visit counts (none visited yet)
    (visited_count split c0)
    (visited_count manchester c0)
    (visited_count geneva c0)
    
    ;; Flight network
    ;; "Split and Geneva" -> bi-directional
    (can_fly split geneva)
    (can_fly geneva split)
    ;; "from Manchester to Split" -> uni-directional
    (can_fly manchester split)
    ;; "Manchester and Geneva" -> bi-directional
    (can_fly manchester geneva)
    (can_fly geneva manchester)
  )

  (:goal
    (and
      ;; The trip must have progressed through 4 full days
      (on_day day5)
      
      ;; Stay requirements (Note: Total 4 days available vs 6 days requested)
      (visited_count split c2)
      (visited_count manchester c2)
      (visited_count geneva c2)
      
      ;; Friend constraint: must be in Split on day 2 and day 3
      (visited_at split day2)
      (visited_at split day3)
    )
  )
)