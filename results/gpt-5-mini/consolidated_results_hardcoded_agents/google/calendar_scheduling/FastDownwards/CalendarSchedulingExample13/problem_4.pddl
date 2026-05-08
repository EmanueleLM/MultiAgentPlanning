(define (problem schedule_gerald_roy_barbara)
  (:domain meeting_scheduler)
  (:objects
    gerald roy barbara - attendee
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30
    t_12_00 t_12_30 t_13_00 t_13_30 t_14_00 t_14_30
    t_15_00 t_15_30 t_16_00 t_16_30 - timeslot
  )
  (:init
    ;; Working-hours marker for each half-hour slot from 09:00 (inclusive) to 17:00 (exclusive)
    (within-working-hours t_09_00) (within-working-hours t_09_30)
    (within-working-hours t_10_00) (within-working-hours t_10_30)
    (within-working-hours t_11_00) (within-working-hours t_11_30)
    (within-working-hours t_12_00) (within-working-hours t_12_30)
    (within-working-hours t_13_00) (within-working-hours t_13_30)
    (within-working-hours t_14_00) (within-working-hours t_14_30)
    (within-working-hours t_15_00) (within-working-hours t_15_30)
    (within-working-hours t_16_00) (within-working-hours t_16_30)

    ;; Explicit ordering of timeslots (successor relation)
    (next t_09_00 t_09_30) (next t_09_30 t_10_00)
    (next t_10_00 t_10_30) (next t_10_30 t_11_00)
    (next t_11_00 t_11_30) (next t_11_30 t_12_00)
    (next t_12_00 t_12_30) (next t_12_30 t_13_00)
    (next t_13_00 t_13_30) (next t_13_30 t_14_00)
    (next t_14_00 t_14_30) (next t_14_30 t_15_00)
    (next t_15_00 t_15_30) (next t_15_30 t_16_00)
    (next t_16_00 t_16_30)

    ;; Feasible slot chosen by the auditor (only one feasible slot to enforce single-step plan)
    (feasible t_14_00)

    ;; Availability facts: only t_14_00 is available for all required attendees,
    ;; reflecting merged calendars and honored preferences (Gerald prefers >= 13:00).
    (available gerald t_14_00)
    (available roy t_14_00)
    (available barbara t_14_00)
  )
  (:goal (scheduled))
)