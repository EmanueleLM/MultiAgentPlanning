(define (problem schedule_meeting_problem)
  (:domain schedule_meeting)
  (:objects
    anthony pamela zachary - participant
    s_1330_1430 - slot
    t_1330 t_1430 - time
  )
  (:init
    ;; Declared objects
    (participant_obj anthony) (participant_obj pamela) (participant_obj zachary)
    (slot_obj s_1330_1430)
    (time_obj t_1330) (time_obj t_1430)

    ;; Temporal characterization of the audited recommended slot (13:30-14:30)
    (slot_start s_1330_1430 t_1330)
    (slot_end s_1330_1430 t_1430)
    (time_before t_1330 t_1430)
    (duration_60 s_1330_1430)

    ;; Availability facts: intersection of free windows and respect Pamela's preference.
    ;; These are asserted as hard facts for the recommended audited slot.
    (available anthony s_1330_1430)
    (available pamela s_1330_1430)
    (available zachary s_1330_1430)
  )
  ;; Terminal goal: meeting must be scheduled (marked in a single atomic step).
  (:goal (and (scheduled)))
)