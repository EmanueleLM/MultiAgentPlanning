(define (problem meeting_planning_example_28)
  (:domain meeting_planning_sf)
  (:objects
    union_square chinatown - location
    joshua - person
    t0900 t0907 t1753 t1800 t1915 t2015 t2130 - time
  )
  (:init
    ;; Starting conditions
    (at_location union_square)
    (at_time t0900)

    ;; Connectivity and Travel (7 minutes)
    ;; Travel early at 9:00 AM
    (can_move union_square chinatown t0900 t0907)
    ;; Travel late to arrive exactly when Joshua's window starts (6:00 PM)
    (can_move union_square chinatown t1753 t1800)

    ;; Waiting possibilities
    ;; Wait at Union Square until it's time for the late move
    (can_wait union_square t0900 t1753)
    ;; Wait at Chinatown if arrived early
    (can_wait chinatown t0907 t1800)
    ;; Wait at Chinatown between different possible meeting blocks
    (can_wait chinatown t1800 t2015)
    ;; Wait at Chinatown after a meeting
    (can_wait chinatown t1915 t2130)

    ;; Joshua's Availability and meeting duration (75 minutes)
    ;; Joshua is at Chinatown from 6:00 PM (t1800) to 9:30 PM (t2130)
    ;; First potential 75-minute meeting block
    (can_meet joshua chinatown t1800 t1915)
    ;; Second potential 75-minute meeting block
    (can_meet joshua chinatown t2015 t2130)
  )
  (:goal
    (has_met joshua)
  )
)