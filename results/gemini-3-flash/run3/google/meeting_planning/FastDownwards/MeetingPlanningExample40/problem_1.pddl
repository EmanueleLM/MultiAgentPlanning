(define (problem meeting_planning_example_40)
  (:domain meeting_planning)
  (:objects
    the_castro sunset_district - location
    t_0900 t_0917 t_1415 t_1530 t_2000 - time
    deborah - person
  )
  (:init
    ;; Initial state: start at The Castro at 9:00 AM
    (at the_castro)
    (time_at t_0900)

    ;; Define travel transition: Castro to Sunset takes 17 mins (09:00 to 09:17)
    (can_travel the_castro sunset_district t_0900 t_0917)
    (can_travel sunset_district the_castro t_0900 t_0917)

    ;; Define waiting transition: wait at Sunset until Deborah arrives at 2:15 PM (14:15)
    (can_wait sunset_district t_0917 t_1415)

    ;; Define meeting transition: meet Deborah at Sunset for 75 mins (14:15 to 15:30)
    ;; Deborah is available from 14:15 to 20:00
    (can_meet deborah sunset_district t_1415 t_1530)

    ;; Remaining time after meeting
    (can_wait sunset_district t_1530 t_2000)
  )
  (:goal
    (and 
      (met deborah)
    )
  )
)