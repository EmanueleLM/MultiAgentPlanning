(define (problem meeting_planning_problem)
  (:domain meeting_planning)
  (:objects
    union_square nob_hill - location
    mary - person
    t_0900 t_0909 t_1200 t_1315 t_1615 - time
  )
  (:init
    (at union_square)
    (at_time t_0900)

    ;; Connectivity and Travel Times
    ;; Union Square to Nob Hill: 9 mins
    (can_move union_square nob_hill t_0900 t_0909)
    
    ;; Person Schedule: Mary at Nob Hill from 12:00PM to 4:15PM
    (person_at mary nob_hill t_1200 t_1615)
    
    ;; Feasible Meeting Durations (Minimum 75 minutes)
    ;; 12:00 to 1:15 is 75 mins
    (can_meet_at t_1200 t_1315)
    ;; 12:00 to 4:15 is 255 mins
    (can_meet_at t_1200 t_1615)
    ;; 1:15 to 4:15 is 180 mins
    (can_meet_at t_1315 t_1615)
    
    ;; Temporal Ordering (is_before t1 t2)
    (is_before t_0900 t_0909)
    (is_before t_0900 t_1200)
    (is_before t_0900 t_1315)
    (is_before t_0900 t_1615)
    
    (is_before t_0909 t_1200)
    (is_before t_0909 t_1315)
    (is_before t_0909 t_1615)
    
    (is_before t_1200 t_1315)
    (is_before t_1200 t_1615)
    
    (is_before t_1315 t_1615)
  )
  (:goal
    (met mary)
  )
)