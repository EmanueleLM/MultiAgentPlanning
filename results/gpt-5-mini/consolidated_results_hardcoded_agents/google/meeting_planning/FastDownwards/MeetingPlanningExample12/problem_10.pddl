(define (problem meeting_planning_example12_problem)
  (:domain meeting_planning_example12)

  (:objects
    north_beach alamo_square - location
    t_0900 t_1744 t_1800 t_2130 - timepoint
    me - person
    barbara - friend
  )

  (:init
    (at me north_beach)
    (now t_0900)

    (friend_at barbara alamo_square)
    (window barbara t_1800 t_2130)

    (succ t_0900 t_1744)
    (succ t_1744 t_1800)
    (succ t_1800 t_2130)

    (travel_slot north_beach alamo_square t_1744 t_1800)
  )

  (:goal (and
    (met barbara)
    (at me alamo_square)
    (now t_2130)
  ))
)