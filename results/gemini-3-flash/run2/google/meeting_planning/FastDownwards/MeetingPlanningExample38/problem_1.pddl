(define (problem meeting_planning_problem)
  (:domain meeting_planning)
  (:objects
    union_square north_beach - location
    t0900 t0910 t2145 t2230 - time
  )
  (:init
    (at union_square t0900)
    ;; Travel from Union Square at 9:00AM takes 10 minutes to reach North Beach.
    (can_travel union_square north_beach t0900 t0910)
    ;; Wait at North Beach from 9:10AM until Margaret arrives at 9:45PM (21:45).
    (next t0910 t2145)
    ;; Margaret is at North Beach from 9:45PM (21:45) to 10:30PM (22:30).
    ;; Meeting her for the required minimum of 45 minutes fits exactly in this window.
    (can_meet_margaret north_beach t2145 t2230)
  )
  (:goal
    (and
      (met_margaret)
    )
  )
)