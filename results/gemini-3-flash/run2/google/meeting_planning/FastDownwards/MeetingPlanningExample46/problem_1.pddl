(define (problem meeting_planning_example_46)
  (:domain meeting_planning)
  (:objects
    haight_ashbury north_beach - location
    t0900 t0919 t1630 t1800 t2130 - timepoint
    robert - person
  )

  (:init
    ;; Starting state: arrived at Haight-Ashbury at 9:00 AM
    (at haight_ashbury)
    (time_at t0900)

    ;; Temporal sequence
    (next t0900 t0919)
    (next t0919 t1630)
    (next t1630 t1800)
    (next t1800 t2130)

    ;; Travel constraints
    ;; Haight-Ashbury to North Beach: 19 mins
    (travel_possible haight_ashbury north_beach t0900 t0919)

    ;; Meeting constraints
    ;; Robert is at North Beach from 4:30 PM (t1630) to 9:30 PM (t2130)
    ;; Required meeting duration is 90 minutes. 4:30 PM to 6:00 PM (t1800) is 90 mins.
    (meeting_possible robert north_beach t1630 t1800)
  )

  (:goal
    (met robert)
  )
)