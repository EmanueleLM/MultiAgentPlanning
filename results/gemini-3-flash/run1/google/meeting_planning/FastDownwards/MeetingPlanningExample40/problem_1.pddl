(define (problem meeting_planning_example_40)
  (:domain meeting_planning)
  (:objects
    the_castro sunset_district - location
    t_0900 t_0917 t_1415 t_1530 t_2000 - time
    deborah - person
  )
  (:init
    ;; Starting state: You are at The Castro at 9:00 AM
    (at_loc the_castro)
    (time_at t_0900)

    ;; Travel constraints: The Castro to Sunset District takes 17 minutes
    ;; (9:00 AM + 17 minutes = 9:17 AM)
    (can_travel the_castro sunset_district t_0900 t_0917)
    (can_travel sunset_district the_castro t_0900 t_0917)

    ;; Waiting possibilities between critical time points
    (can_wait t_0900 t_0917)
    (can_wait t_0917 t_1415)
    (can_wait t_1415 t_1530)
    (can_wait t_1530 t_2000)

    ;; Deborah is at Sunset District from 2:15 PM (14:15) to 8:00 PM (20:00)
    ;; Meeting for a minimum of 75 minutes (14:15 to 15:30)
    (can_meet deborah sunset_district t_1415 t_1530)
  )
  (:goal 
    ;; Objective: Meet Deborah
    (met deborah)
  )
)