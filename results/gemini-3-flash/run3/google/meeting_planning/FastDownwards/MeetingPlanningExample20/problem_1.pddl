(define (problem meeting_planning_example_20)
  (:domain meeting_planning)
  (:objects
    chinatown nob_hill - location
    joseph - person
    t_0900 t_0908 t_1130 t_1245 t_1515 - timepoint
  )
  (:init
    (at_loc chinatown)
    (time_at t_0900)
    
    ;; Travel from Chinatown to Nob Hill (8 minutes)
    (can_travel chinatown nob_hill t_0900 t_0908)
    
    ;; Waiting possibilities
    (can_wait t_0900 t_0908)
    (can_wait t_0908 t_1130)
    (can_wait t_1130 t_1245)
    (can_wait t_1245 t_1515)
    
    ;; Joseph availability for a 75-minute meeting
    ;; Joseph is at Nob Hill from 11:30 to 15:15
    ;; Starting at 11:30, 75 minutes brings us to 12:45
    (available joseph nob_hill t_1130 t_1245)
  )
  (:goal
    (and
      (met joseph)
    )
  )
)