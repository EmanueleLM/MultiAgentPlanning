(define (problem schedule_gerald_roy_barbara)
  (:domain meeting_scheduler)
  (:objects
    gerald roy barbara - attendee
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - timeslot
  )

  (:init
    ;; explicit ordering of half-hour slots covering 09:00-17:00
    (next t_09_00 t_09_30)
    (next t_09_30 t_10_00)
    (next t_10_00 t_10_30)
    (next t_10_30 t_11_00)
    (next t_11_00 t_11_30)
    (next t_11_30 t_12_00)
    (next t_12_00 t_12_30)
    (next t_12_30 t_13_00)
    (next t_13_00 t_13_30)
    (next t_13_30 t_14_00)
    (next t_14_00 t_14_30)
    (next t_14_30 t_15_00)
    (next t_15_00 t_15_30)
    (next t_15_30 t_16_00)
    (next t_16_00 t_16_30)

    ;; Only the audited feasible slot is declared feasible so planner produces a single-step plan.
    (feasible t_14_00)

    ;; Availability facts for the chosen slot (consistent with agents' calendars and the audited decision).
    (available gerald t_14_00)
    (available roy t_14_00)
    (available barbara t_14_00)
  )

  (:goal (scheduled))
)