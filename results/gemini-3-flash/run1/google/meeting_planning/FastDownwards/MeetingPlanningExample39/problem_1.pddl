(define (problem meeting_planning_example_39)
  (:domain meeting_planning)
  (:objects
    fishermans_wharf nob_hill - location
    t_0900 t_0911 t_1645 t_1845 t_2145 - timepoint
    stephanie - person
  )
  (:init
    (at fishermans_wharf)
    (time t_0900)
    
    ;; Travel duration is 11 minutes
    ;; From 09:00 AM to 09:11 AM
    (can_travel fishermans_wharf nob_hill t_0900 t_0911)
    
    ;; Wait at Nob Hill from arrival (09:11 AM) until Stephanie arrives (04:45 PM / 16:45)
    (can_wait nob_hill t_0911 t_1645)
    
    ;; Stephanie is at Nob Hill from 04:45 PM (16:45) to 09:45 PM (21:45)
    ;; Goal is to meet for a minimum of 120 minutes
    ;; Meeting from 16:45 to 18:45 (6:45 PM) satisfies the 120-minute requirement
    (can_meet stephanie nob_hill t_1645 t_1845)
    
    ;; Optional: Wait until she leaves
    (can_wait nob_hill t_1845 t_2145)
  )
  (:goal (met stephanie))
)