(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    lyon frankfurt krakow - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
    step_0 step_1 step_2 step_3 step_4 step_5 step_6 step_7 step_8 step_9 step_10 - step
  )
  (:init
    (ready_to_start)
    
    ;; City stays initialization
    (stay_count lyon step_0)
    (stay_count frankfurt step_0)
    (stay_count krakow step_0)
    
    ;; Day sequence
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)
    
    ;; Counting steps
    (next_step step_0 step_1)
    (next_step step_1 step_2)
    (next_step step_2 step_3)
    (next_step step_3 step_4)
    (next_step step_4 step_5)
    (next_step step_5 step_6)
    (next_step step_6 step_7)
    (next_step step_7 step_8)
    (next_step step_8 step_9)
    (next_step step_9 step_10)
    
    ;; Direct flight connections
    (connection lyon frankfurt)
    (connection frankfurt lyon)
    (connection frankfurt krakow)
    (connection krakow frankfurt)
  )
  (:goal
    (and
      ;; Stay requirements (Total city-days: 7+2+3=12, while trip is 10 days)
      (stay_count lyon step_7)
      (stay_count frankfurt step_2)
      (stay_count krakow step_3)
      
      ;; Special show in Krakow (Day 8 to Day 10)
      (visited krakow day_8)
      (visited krakow day_9)
      (visited krakow day_10)
    )
  )
)