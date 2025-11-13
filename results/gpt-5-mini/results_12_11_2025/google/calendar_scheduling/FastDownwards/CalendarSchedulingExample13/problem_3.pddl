(define (problem schedule_gerald_roy_barbara)
  (:domain meeting_scheduler)
  (:objects
    gerald roy barbara - attendee
    t_14_00 - timeslot
  )
  (:init
    ;; Only facts required to support the single feasible chosen slot
    (available gerald t_14_00)
    (available roy t_14_00)
    (available barbara t_14_00)
    (feasible t_14_00)
  )
  (:goal (scheduled))
)