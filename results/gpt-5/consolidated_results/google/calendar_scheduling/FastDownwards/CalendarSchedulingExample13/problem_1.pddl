(define (problem calendar-scheduling-example13)
  (:domain meeting-schedule)
  (:objects
    gerald roy barbara - attendee
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - timeslot
  )
  (:init
    (feasible t_14_00)
  )
  (:goal (and
    (scheduled)
  ))
)