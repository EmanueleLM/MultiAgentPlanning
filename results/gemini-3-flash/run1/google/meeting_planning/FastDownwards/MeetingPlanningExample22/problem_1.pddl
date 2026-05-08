(define (problem meeting_planning_problem)
  (:domain meeting_planning_domain)
  (:objects
    presidio union_square - location
    t0900 t0922 t1115 t1300 - time
  )
  (:init
    ;; Starting conditions: At Presidio at 9:00 AM.
    (at presidio)
    (time_at t0900)

    ;; Travel distance: Presidio to Union Square is 22 minutes (9:00 to 9:22).
    (can_travel presidio union_square t0900 t0922)

    ;; Waiting: Wait until Andrew arrives at Union Square at 11:15 AM.
    (next t0922 t1115)

    ;; Andrew's availability: He is at Union Square from 11:15 AM.
    ;; We define his presence at the start and end points of our intended meeting.
    (andrew_at union_square t1115)
    (andrew_at union_square t1300)

    ;; Meeting duration requirement: At least 105 minutes.
    ;; 11:15 AM to 1:00 PM (13:00) is exactly 105 minutes.
    (meeting_duration_ok t1115 t1300)
  )
  (:goal (met_andrew))
)