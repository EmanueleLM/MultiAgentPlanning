(define (problem trip_planning_example8_problem)
  (:domain trip_planning_example8)
  (:objects
    athens zurich krakow - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day
    count_0 count_1 count_2 count_3 count_4 count_5 count_6 count_7 - count
  )
  (:init
    (at athens)
    (is_athens athens)
    (current_day day_1)
    
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
    (next_day day_10 day_11)
    (next_day day_11 day_12)
    (next_day day_12 day_13)
    (next_day day_13 day_14)
    (next_day day_14 day_15)
    (next_day day_15 day_16)
    
    ;; Count progression
    (next_count count_0 count_1)
    (next_count count_1 count_2)
    (next_count count_2 count_3)
    (next_count count_3 count_4)
    (next_count count_4 count_5)
    (next_count count_5 count_6)
    (next_count count_6 count_7)
    
    ;; Initial stay counts
    (stay_count athens count_0)
    (stay_count zurich count_0)
    (stay_count krakow count_0)
    
    ;; Flight connections
    (can_fly athens zurich)
    (can_fly zurich athens)
    (can_fly zurich krakow)
    (can_fly krakow zurich)
    
    ;; Relative visit window in Athens (Day 1 to 7)
    (is_relatives_window day_1)
    (is_relatives_window day_2)
    (is_relatives_window day_3)
    (is_relatives_window day_4)
    (is_relatives_window day_5)
    (is_relatives_window day_6)
    (is_relatives_window day_7)
  )
  (:goal (and
    (stay_count athens count_7)
    (stay_count zurich count_5)
    (stay_count krakow count_6)
    (relatives_visited)
  ))
)