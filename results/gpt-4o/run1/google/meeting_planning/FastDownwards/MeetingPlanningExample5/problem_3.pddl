(define (problem meet_william)
  (:domain meeting_schedule)
  (:objects
    nob_hill the_castro - location
    william - person
    t_09_00 t_09_17 t_09_33 t_09_49 t_10_05 t_12_15 t_13_30 t_14_45 t_22_00 - time
  )
  
  (:init
    (at nob_hill)
    (available william the_castro t_12_15 t_22_00)
    (current_time t_09_00)
    (next_time t_09_00 t_09_17)
    (next_time t_09_17 t_09_33)
    (next_time t_09_33 t_09_49)
    (next_time t_09_49 t_10_05)
    
    ; Define possible meeting from 12:15 to at least 13:30
    (meeting_possible william t_12_15 t_13_30)
    (next_time t_12_15 t_13_30)
    (next_time t_13_30 t_14_45)
    (next_time t_14_45 t_22_00)
  )
  
  (:goal (and
    (visited the_castro)
    (meeting_scheduled william)
  ))
)