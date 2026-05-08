(define (problem meet_william)
  (:domain meeting_schedule)
  (:objects
    nob_hill - location
    the_castro - location
    william - person
    t_09_00 t_12_15 t_13_30 t_14_45 t_22_00 - time
  )
  
  (:init
    (at nob_hill)
    (available william the_castro t_12_15 t_22_00)

    (current_time t_09_00)
    (next_time t_09_00 t_12_15)
    (next_time t_12_15 t_13_30)
    (next_time t_13_30 t_14_45)
    (next_time t_14_45 t_22_00)
  )
  
  (:goal (and
    (visited the_castro)
    (meeting_scheduled william)
  ))
)