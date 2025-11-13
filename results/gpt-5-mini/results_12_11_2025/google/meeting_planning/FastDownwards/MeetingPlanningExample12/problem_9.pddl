(define (problem meeting_planning_example12-problem)
  (:domain meeting_planning_example12)

  (:objects
    north_beach alamo_square - location
    t_0900 t_1744 t_1800 t_2130 - timepoint
    me - person
    barbara - friend
  )

  (:init
    ;; Initial location and current time
    (at me north_beach)
    (now t_0900)

    ;; Friend facts and availability window
    (friend_at barbara alamo_square)
    (window barbara t_1800 t_2130)

    ;; Explicit successor relations (ordered stages). These encode the allowed contiguous transitions.
    ;; t_0900 -> t_1744 represents waiting from 09:00 to 17:44
    ;; t_1744 -> t_1800 represents travel taking exactly 16 minutes (17:44 -> 18:00)
    ;; t_1800 -> t_2130 represents the contiguous meeting block (18:00 -> 21:30, 210 minutes)
    (succ t_0900 t_1744)
    (succ t_1744 t_1800)
    (succ t_1800 t_2130)

    ;; Travel slots enforce exact travel duration and forbid alternative compression.
    (travel_slot north_beach alamo_square t_1744 t_1800)
  )

  (:goal (and
    (met barbara)
    (at me alamo_square)
    (now t_2130)
  ))
)