(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    manchester bucharest lyon - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 day_17 day_18 - day
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 - stage
  )
  (:init
    ;; Starting position and time
    (at manchester)
    (current_day day_1)
    
    ;; Initial visit progress for each city
    (progress manchester stage_0)
    (progress bucharest stage_0)
    (progress lyon stage_0)
    
    ;; Chronological order of days
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)
    (next_day day_10 day_11)
    (next_day day_11 day_12)
    (next_day day_12 day_13)
    (next_day day_13 day_14)
    (next_day day_14 day_15)
    (next_day day_15 day_16)
    (next_day day_16 day_17)
    (next_day day_17 day_18)
    
    ;; Visit-duration stages
    (next_stage stage_0 stage_1)
    (next_stage stage_1 stage_2)
    (next_stage stage_2 stage_3)
    (next_stage stage_3 stage_4)
    (next_stage stage_4 stage_5)
    (next_stage stage_5 stage_6)
    (next_stage stage_6 stage_7)
    
    ;; Flight connectivity
    (has_flight manchester bucharest)
    (has_flight bucharest manchester)
    (has_flight bucharest lyon)
    (has_flight lyon bucharest)
  )
  (:goal (and
    ;; Ensure the trip lasts the full 17 days (completing day 17)
    (current_day day_18)
    
    ;; Duration visit constraints
    (progress manchester stage_7)
    (progress bucharest stage_7)
    (progress lyon stage_5)
    
    ;; Specific timing constraint for Lyon
    (visited lyon day_13)
    (visited lyon day_14)
    (visited lyon day_15)
    (visited lyon day_16)
    (visited lyon day_17)
  ))
)