(define (problem meeting_planning_problem)
  (:domain meeting_planning_domain)
  (:objects
    financial_district union_square - location
    t_0900_am t_0909_am t_2130_pm t_2145_pm - time
    joseph - person
  )
  (:init
    (at_loc financial_district)
    (time_at t_0900_am)
    
    ;; Travel FD to US takes 9 minutes (9:00 AM to 9:09 AM)
    (can_travel financial_district union_square t_0900_am t_0909_am)
    
    ;; Wait from arrival (9:09 AM) until Joseph arrives (9:30 PM)
    (can_wait t_0909_am t_2130_pm)
    
    ;; Meet Joseph at US for 15 minutes within his 9:30 PM - 10:00 PM window
    (can_meet joseph union_square t_2130_pm t_2145_pm)
  )
  (:goal
    (met joseph)
  )
)