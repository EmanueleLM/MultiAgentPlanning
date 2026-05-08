(define (problem schedule_gerald_roy_barbara)
  (:domain meeting_scheduler)
  (:objects
    gerald roy barbara - attendee
    t_14_00 - timeslot
  )
  (:init
    ;; Only the single feasible/available slot is declared so the planner
    ;; produces a one-step plan selecting it.
    (feasible t_14_00)
    (available gerald t_14_00)
    (available roy t_14_00)
    (available barbara t_14_00)
  )
  (:goal (scheduled))
)