(define (problem meeting_planning_problem)
  (:domain meeting_planning)
  (:objects
    nob_hill presidio - location
    t_0900 t_0917 t_1100 t_1130 t_1515 - time
    matthew - person
  )
  (:init
    (at nob_hill)
    (time_at t_0900)
    
    ;; Travel from Nob Hill to Presidio takes 17 minutes.
    ;; Leaving at 9:00 AM arrives at 9:17 AM.
    (travel_time nob_hill presidio t_0900 t_0917)
    
    ;; Wait from arrival at 9:17 AM until Matthew is available at 11:00 AM.
    (next t_0917 t_1100)
    
    ;; Matthew is at Presidio from 11:00 AM to 3:15 PM (15:15).
    ;; Meeting for 30 minutes starting at 11:00 AM ends at 11:30 AM.
    (can_meet matthew presidio t_1100 t_1130)
    
    ;; Optional time progression after meeting.
    (next t_1130 t_1515)
  )
  (:goal (met matthew))
)