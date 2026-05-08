(define (problem meeting_planning_example_41)
  (:domain meeting_planning)
  (:objects
    north_beach haight_ashbury - location
    george - person
    t900 t918 t1003 - time
  )
  (:init
    ;; Starting point: North Beach at 9:00 AM
    (at north_beach)
    (time_at t900)

    ;; Connectivity and Travel Times
    ;; North Beach to Haight-Ashbury takes 18 minutes (9:00 -> 9:18)
    (path north_beach haight_ashbury t900 t918)

    ;; Meeting Constraints
    ;; George is at Haight-Ashbury from 7:30 AM to 1:15 PM.
    ;; We arrive at 9:18 AM and need to meet for at least 45 minutes.
    ;; 9:18 AM + 45 minutes = 10:03 AM.
    ;; Since 10:03 AM is before 1:15 PM, this meeting window is valid.
    (can_meet george haight_ashbury t918 t1003)
  )
  (:goal (and (met george)))
)