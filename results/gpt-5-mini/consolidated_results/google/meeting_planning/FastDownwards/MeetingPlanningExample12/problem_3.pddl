(define (problem meeting_planning_example12-problem)
  (:domain meeting_planning_example12)

  (:objects
    north_beach alamo_square - location
    barbara - friend
    time_0900 time_1744 time_1800 time_2130 time_2145 - timepoint
  )

  (:init
    ;; start location and initial discrete timepoint
    (at north_beach)
    (time time_0900)

    ;; Barbara's presence and availability window
    (barbara_at alamo_square)
    (window_barbara time_1800 time_2130)

    ;; connectivity
    (connected north_beach alamo_square)
    (connected alamo_square north_beach)

    ;; travel slots enforce exact travel durations (discrete anchors)
    (travel_slot north_beach alamo_square time_1744 time_1800)
    (travel_slot alamo_square north_beach time_2130 time_2145)
  )

  (:goal (and
    (met_barbara)
  ))
)