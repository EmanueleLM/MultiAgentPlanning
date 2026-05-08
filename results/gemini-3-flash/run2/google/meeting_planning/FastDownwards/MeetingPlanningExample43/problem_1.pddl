(define (problem meeting_planning_example)
  (:domain meeting_planning)
  (:objects
    me sandra - person
    marina_district chinatown - location
    t900 t916 t931 t1145 - time
  )
  (:init
    (at me marina_district)
    (cur_time t900)
    
    ;; Sandra's schedule: at Chinatown from 9:00 to 11:45
    (person_at sandra chinatown t900)
    (person_at sandra chinatown t916)
    (person_at sandra chinatown t931)
    (person_at sandra chinatown t1145)
    
    ;; Travel duration from Marina District to Chinatown is 16 minutes
    (can_travel marina_district chinatown t900 t916)
    
    ;; Meeting Sandra at Chinatown for 15 minutes
    (can_meet sandra chinatown t916 t931)
  )
  (:goal
    (met sandra)
  )
)