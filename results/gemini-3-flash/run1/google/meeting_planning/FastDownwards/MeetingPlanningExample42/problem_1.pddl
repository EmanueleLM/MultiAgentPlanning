(define (problem meeting_planning_example_42)
  (:domain meeting_planning)
  (:objects
    nob_hill presidio - location
    t_0900 t_0917 t_1300 t_1330 t_1348 t_1900 - time
    timothy - person
  )

  (:init
    ;; Starting state: Arrive at Nob Hill at 9:00 AM
    (at nob_hill)
    (time_at t_0900)

    ;; Travel from Nob Hill to Presidio takes 17 minutes.
    ;; If we leave at 9:00 AM, we arrive at 9:17 AM.
    (can_travel nob_hill presidio t_0900 t_0917)

    ;; Once at Presidio at 9:17 AM, we must wait until Timothy arrives at 1:00 PM (t_1300).
    (can_wait presidio t_0917 t_1300)

    ;; Timothy is at Presidio from 1:00 PM (t_1300) to 7:00 PM (t_1900).
    ;; We meet Timothy for a minimum of 30 minutes (from t_1300 to t_1330).
    (can_meet timothy presidio t_1300 t_1330)

    ;; Optional additional transitions based on provided travel/availability data:
    ;; Travel from Presidio back to Nob Hill takes 18 minutes (e.g., after the meeting).
    (can_travel presidio nob_hill t_1330 t_1348)
    
    ;; We can wait at Presidio until Timothy leaves at 7:00 PM (t_1900).
    (can_wait presidio t_1330 t_1900)
  )

  (:goal
    (and
      (met timothy)
    )
  )
)