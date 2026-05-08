(define (problem meeting_planning_example_5)
  (:domain meeting_planning)
  (:objects
    nob_hill the_castro - location
    william - person
    t_0900 t_0917 t_1215 t_1330 t_1346 - time
  )
  (:init
    (at_location nob_hill)
    (current_time t_0900)
    
    ;; 9:00 AM + 17 minutes travel time to The Castro = 9:17 AM
    (can_travel nob_hill the_castro t_0900 t_0917)
    
    ;; Wait at The Castro from arrival until William arrives at 12:15 PM
    (can_wait the_castro t_0917 t_1215)
    
    ;; William is at The Castro from 12:15 PM to 10:00 PM.
    ;; Meeting William for the minimum 75 minutes (12:15 PM + 75m = 1:30 PM / 13:30)
    (friend_at william the_castro t_1215 t_1330)
    
    ;; Optional travel back from The Castro to Nob Hill (16 minutes)
    (can_travel the_castro nob_hill t_1330 t_1346)
  )
  (:goal
    (met william)
  )
)