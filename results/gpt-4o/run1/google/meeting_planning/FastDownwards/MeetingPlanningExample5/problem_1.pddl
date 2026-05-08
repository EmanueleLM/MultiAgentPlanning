(define (problem meet_william)
  (:domain meeting_schedule)
  (:objects
    nob_hill - location
    the_castro - location
    william - person
    t_09_00 t_12_15 t_13_30 t_22_00 - time
  )
  
  (:init
    (at nob_hill)
    (available william the_castro t_12_15 t_22_00)
    (time_valid t_09_00)
    (time_valid t_12_15)
    (time_valid t_13_30)
    (time_valid t_22_00)
    (can_meet the_castro william t_12_15 t_13_30)
  )
  
  (:goal (and
    (visited the_castro)
    (meeting_scheduled william)
  ))
)