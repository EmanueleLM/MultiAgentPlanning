(define (problem meeting_planning_46_problem)
  (:domain meeting_planning_46)
  (:objects
    haight_ashbury north_beach - location
    t0900 t0919 t1630 t1800 t2130 - time
    robert - friend
  )
  (:init
    ;; Starting state: User arrives at Haight-Ashbury at 9:00AM
    (at haight_ashbury)
    (time_at t0900)

    ;; Travel time: Haight-Ashbury to North Beach takes 19 minutes
    (travel_time haight_ashbury north_beach t0900 t0919)

    ;; Waiting: After arriving early (9:19AM), the user must wait until Robert arrives (4:30PM)
    (next t0919 t1630)

    ;; Robert's meeting: Robert is at North Beach starting at 4:30PM (t1630)
    ;; Meeting for 90 minutes results in a completion time of 6:00PM (t1800)
    ;; This is well within his window of 4:30PM to 9:30PM (t1630 to t2130)
    (can_meet robert north_beach t1630 t1800)

    ;; Optional window padding (Wait after meeting)
    (next t1800 t2130)
  )
  (:goal
    (met robert)
  )
)