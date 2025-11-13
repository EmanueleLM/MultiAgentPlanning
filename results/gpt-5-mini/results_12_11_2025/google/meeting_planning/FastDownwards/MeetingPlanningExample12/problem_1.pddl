(define (problem MeetingPlanningExample12-problem)
  (:domain MeetingPlanningExample12)

  (:objects
    north_beach alamo_square - location
    barbara - friend
    time_0900 time_1744 time_1800 time_2130 time_2145 - timepoint
  )

  (:init
    ;; starting location and time
    (at north_beach)
    (time time_0900)

    ;; Barbara's known location and availability are enforced by the domain actions' timepoints:
    ;; barbara is at Alamo Square (meeting action requires her to be at that location at 18:00)
    (barbara-at alamo_square)

    ;; connectivity facts (used by travel actions)
    (connected north_beach alamo_square)
    (connected alamo_square north_beach)
  )

  ;; Goal: succeed in meeting Barbara (the planner must produce actions that respect the timepoint transitions
  ;; and thus the travel durations and the availability window).
  (:goal (and
    (met-barbara)
  ))
)