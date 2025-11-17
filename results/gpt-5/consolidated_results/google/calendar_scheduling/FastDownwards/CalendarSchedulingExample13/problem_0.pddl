(define (problem meeting-prob)
  (:domain meeting-schedule)
  (:objects
    gerald roy barbara - attendee
    t_14_00 - timeslot
  )
  (:init
    (feasible t_14_00)
  )
  (:goal (and
    (scheduled)
  ))
)