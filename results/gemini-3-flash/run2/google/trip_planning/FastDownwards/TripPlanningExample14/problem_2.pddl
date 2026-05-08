(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    lyon frankfurt krakow - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
    count_0 count_1 count_2 count_3 count_4 count_5 count_6 count_7 count_8 count_9 count_10 - count
  )
  (:init
    (ready_to_start)
    (is_day_1 day_1)
    
    ;; Counts for cities
    (day_count lyon count_0)
    (day_count frankfurt count_0)
    (day_count krakow count_0)
    
    ;; Count progression
    (next_count count_0 count_1)
    (next_count count_1 count_2)
    (next_count count_2 count_3)
    (next_count count_3 count_4)
    (next_count count_4 count_5)
    (next_count count_5 count_6)
    (next_count count_6 count_7)
    (next_count count_7 count_8)
    (next_count count_8 count_9)
    (next_count count_9 count_10)
    
    ;; Day progression
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)
    
    ;; Direct flight connections
    (flight lyon frankfurt)
    (flight frankfurt lyon)
    (flight frankfurt krakow)
    (flight krakow frankfurt)
  )
  (:goal
    (and
      ;; Spend 7 days in Lyon
      (day_count lyon count_7)
      
      ;; Spend 3 days in Krakow
      (day_count krakow count_3)
      
      ;; Visit Frankfurt for 2 days
      (day_count frankfurt count_2)
      
      ;; Attend show in Krakow (Day 8 to Day 10)
      (at krakow day_8)
      (at krakow day_9)
      (at krakow day_10)
    )
  )
)