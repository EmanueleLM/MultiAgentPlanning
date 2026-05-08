(define (problem meeting_planning_problem)
  (:domain meeting_planning)
  (:objects
    me william - person
    nob_hill the_castro - location
    t0900 t0917 t1215 t1330 - time
  )
  (:init
    (at me nob_hill)
    (time_at t0900)
    
    ;; Travel leg: Nob Hill to The Castro (17 minutes)
    (travel_leg nob_hill the_castro t0900 t0917)
    
    ;; Wait leg: Waiting at The Castro from 9:17 AM until William arrives at 12:15 PM
    (wait_leg the_castro t0917 t1215)
    
    ;; Meeting leg: Meeting William at The Castro from 12:15 PM to 1:30 PM (75 minutes)
    ;; William is available until 10:00 PM, so this window is feasible.
    (meeting_leg william the_castro t1215 t1330)
  )
  (:goal (met william))
)