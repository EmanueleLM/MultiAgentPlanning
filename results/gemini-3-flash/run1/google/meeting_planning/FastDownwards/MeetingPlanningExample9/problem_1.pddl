(define (problem meeting_planning_example_9)
  (:domain meeting_planning)
  (:objects
    me mary - person
    union_square nob_hill - location
    t0900 t0909 t1151 t1200 t1315 t1615 - time
  )
  (:init
    ;; Starting state: You are at Union Square at 9:00 AM
    (at me union_square)
    (at mary nob_hill)
    (time_at t0900)

    ;; Connectivity and schedule data
    ;; Travel US to NH takes 9 minutes
    (can_travel union_square nob_hill t0900 t0909)
    (can_travel union_square nob_hill t1151 t1200)

    ;; Waiting options
    (can_wait t0900 t1151)
    (can_wait t0909 t1200)
    (can_wait t1315 t1615)

    ;; Mary is at Nob Hill from 12:00 PM to 4:15 PM
    ;; A meeting of 75 minutes is possible starting at 12:00 PM and ending at 1:15 PM (t1315)
    (can_meet mary nob_hill t1200 t1315)
  )
  (:goal (and (met mary)))
)