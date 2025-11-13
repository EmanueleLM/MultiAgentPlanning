(define (problem MeetingPlanningExample12-problem)
  (:domain MeetingPlanningExample12)

  (:objects
    north_beach alamo_square - location
    barbara - friend
    ;; Discrete timepoints used as ordered stages / anchors (only the explicit needed times are modeled)
    time_0900 time_1744 time_1800 time_2130 time_2145 - timepoint
  )

  (:init
    ;; starting location and time
    (at north_beach)
    (time time_0900)

    ;; Barbara is present at Alamo Square (her availability window is supplied separately)
    (barbara-at alamo_square)

    ;; connectivity facts for allowed travel directions
    (connected north_beach alamo_square)
    (connected alamo_square north_beach)

    ;; travel_slot facts enforce exact travel durations:
    ;; - departing North Beach at 17:44 arrives Alamo Square at 18:00 (16 minutes)
    (travel_slot north_beach alamo_square time_1744 time_1800)
    ;; - returning from Alamo Square at 21:30 arrives North Beach at 21:45 (15 minutes)
    (travel_slot alamo_square north_beach time_2130 time_2145)

    ;; Barbara's contiguous availability window is exactly 18:00 to 21:30.
    ;; This encodes that meetings spanning from time_1800 to time_2130 are fully inside her window.
    (window_barbara time_1800 time_2130)
  )

  ;; Goal: meet Barbara (the domain enforces that any meeting action advances time appropriately
  ;; and only allowed travel slots and availability windows are usable).
  (:goal (and
    (met-barbara)
  ))
)