(define (problem meeting_planning_example_42)
  (:domain meeting_planning)
  (:objects
    nob_hill presidio - location
    t_0900 t_0917 t_1300 t_1330 - time
    timothy - person
  )

  (:init
    ;; Starting state: User is at Nob Hill at 9:00 AM
    (at nob_hill)
    (time_at t_0900)

    ;; Travel distance from Nob Hill to Presidio is 17 minutes.
    ;; Leaving at 9:00 AM (t_0900) arrives at 9:17 AM (t_0917).
    (can_travel nob_hill presidio t_0900 t_0917)

    ;; Once at the Presidio, wait until Timothy arrives at 1:00 PM (t_1300).
    (can_wait t_0917 t_1300)

    ;; Timothy is at the Presidio from 1:00 PM (t_1300) to 7:00 PM.
    ;; A meeting of 30 minutes from 1:00 PM (t_1300) to 1:30 PM (t_1330) is feasible.
    (can_meet timothy presidio t_1300 t_1330)
  )

  (:goal
    (and
      (met timothy)
    )
  )
)