(define (problem schedule_gerald_roy_barbara)
  (:domain meeting_scheduler)
  (:objects
    gerald roy barbara - attendee
    t_14_00 t_10_00 t_10_30 t_11_00 - timeslot
  )
  (:init
    ;; attendees
    (attendee gerald)
    (attendee roy)
    (attendee barbara)

    ;; explicit ordering of the enumerated timeslots (contiguity / ordering information)
    (next t_10_00 t_10_30)
    (next t_10_30 t_11_00)
    (next t_11_00 t_14_00)

    ;; only the chosen slot is feasible; earlier slots have been removed to honor constraints
    (feasible t_14_00)
  )
  ;; goal: a slot has been scheduled (single-step plan via choose-slot on t_14_00)
  (:goal (scheduled))
)