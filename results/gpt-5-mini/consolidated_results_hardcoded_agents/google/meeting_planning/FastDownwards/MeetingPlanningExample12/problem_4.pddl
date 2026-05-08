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
    (at_agent you north_beach)
    (now t_0900)

    ;; Barbara's presence and availability window (exact anchored window)
    (at_friend barbara alamo_square)
    (window_barbara t_1800 t_2130)

    ;; connectivity facts
    (connected north_beach alamo_square)
    (connected alamo_square north_beach)

    ;; travel slots enforce exact travel durations (discrete anchors)
    ;; North Beach -> Alamo Square is exactly 16 minutes: t_1744 -> t_1800
    (travel_slot north_beach alamo_square t_1744 t_1800)

    ;; Note: no other travel slots are provided so other moves are not allowed.
  )

  ;; Terminal conditions: Barbara met, you are at Alamo Square, and current time equals 21:30.
  (:goal (and
    (met_barbara)
    (at_agent you alamo_square)
    (now t_2130)
  ))
)