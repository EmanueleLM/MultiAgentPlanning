(define (problem meeting_planning_example12-problem)
  (:domain meeting_planning_example12)

  (:objects
    north_beach alamo_square - location
    t_0900 t_1744 t_1800 t_2130 - timepoint
    me - person
    barbara - friend
  )

  (:init
    ; initial location and time
    (at me north_beach)
    (now t_0900)

    ; friend's fixed location and availability window (18:00 - 21:30)
    (friend_at barbara alamo_square)
    (window barbara t_1800 t_2130)

    ; explicit ordered timepoints (discrete stages)
    (succ t_0900 t_1744)
    (succ t_1744 t_1800)
    (succ t_1800 t_2130)

    ; travel slot enforces exact travel duration North Beach -> Alamo Square = 16 minutes (modeled as the t_1744->t_1800 slot)
    (travel_slot north_beach alamo_square t_1744 t_1800)
  )

  (:goal (and
    (met barbara)
    (at me alamo_square)
    (now t_2130)
  ))
)