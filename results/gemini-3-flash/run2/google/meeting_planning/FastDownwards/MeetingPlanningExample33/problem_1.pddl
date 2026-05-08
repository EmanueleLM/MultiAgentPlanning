(define (problem meeting_planning_example_33)
  (:domain meeting_planning)
  
  (:objects
    me - person
    sarah - friend
    sunset_district union_square - location
    t_0900 t_0930 t_1230 t_1245 - time
  )

  (:init
    ;; Starting location at 9:00 AM
    (at me sunset_district t_0900)
    
    ;; Travel distance: Sunset District to Union Square (30 min)
    (dist sunset_district union_square t_0900 t_0930)
    
    ;; Waiting period: Wait at Union Square until Sarah arrives
    (wait_at union_square t_0930 t_1230)
    
    ;; Sarah's availability at Union Square (12:30 PM to 9:30 PM)
    ;; We only need her presence at the start and end of the 15-minute meeting window.
    (friend_at sarah union_square t_1230)
    (friend_at sarah union_square t_1245)
    
    ;; Minimum meeting duration (15 min)
    (meeting_duration t_1230 t_1245)
  )

  (:goal
    (and
      (met sarah)
    )
  )
)