(define (problem meeting_planning_example12-problem)
  (:domain meeting_planning_example12)

  (:objects
    ;; locations
    north_beach alamo_square - location

    ;; discrete timepoints (anchors)
    t_0900 t_1744 t_1800 t_2130 - timepoint

    ;; agents / friends
    you - agent
    barbara - friend
  )

  (:init
    ;; initial position and starting time
    (at you north_beach)
    (now t_0900)

    ;; Barbara's presence and availability window (anchored)
    (friend_at barbara alamo_square)
    (window barbara t_1800 t_2130)

    ;; ordered time anchors (succ defines allowed contiguous jumps used by actions)
    (succ t_0900 t_1744)
    (succ t_1744 t_1800)
    (succ t_1800 t_2130)

    ;; travel slot enforces exact travel duration for the specific anchored jump:
    ;; North Beach -> Alamo Square is exactly 16 minutes: represented by the t_1744 -> t_1800 slot
    (travel_slot north_beach alamo_square t_1744 t_1800)
  )

  ;; Terminal conditions: Barbara met, you at Alamo Square, and current time equals 21:30.
  (:goal (and
    (met_barbara)
    (at you alamo_square)
    (now t_2130)
  ))
)