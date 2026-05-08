(define (problem meeting_sarah)
  (:domain meeting_planning_sf)
  (:objects
    richmond_district bayview - location
    t_0900 t_0926 t_1415 t_1500 - time
    sarah - person
  )
  (:init
    (at_me richmond_district)
    (time_at t_0900)
    
    ;; Travel from Richmond District to Bayview (26 minutes)
    (can_travel richmond_district bayview t_0900 t_0926)
    
    ;; Wait at Bayview from arrival until Sarah arrives (9:26 AM to 2:15 PM)
    (can_wait t_0926 t_1415)
    
    ;; Sarah is at Bayview from 2:15 PM to 5:30 PM.
    ;; We meet her for the minimum required 45 minutes (2:15 PM to 3:00 PM).
    (person_at sarah bayview t_1415 t_1500)
  )
  (:goal (met sarah))
)