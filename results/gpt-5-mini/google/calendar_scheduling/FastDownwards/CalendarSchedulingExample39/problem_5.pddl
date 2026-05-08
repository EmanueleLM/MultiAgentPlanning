(define (problem schedule_meeting_monday)
  (:domain calendar_scheduling_example39)
  (:objects
    emily victoria nancy - person
    t_9_00 t_9_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - time_slot
  )
  (:init
    ;; working hours: 9:00-17:00 in 30-min slots (last slot starts at 16:30)
    (work_slot t_9_00) (work_slot t_9_30) (work_slot t_10_00) (work_slot t_10_30)
    (work_slot t_11_00) (work_slot t_11_30) (work_slot t_12_00) (work_slot t_12_30)
    (work_slot t_13_00) (work_slot t_13_30) (work_slot t_14_00) (work_slot t_14_30)
    (work_slot t_15_00) (work_slot t_15_30) (work_slot t_16_00) (work_slot t_16_30)

    ;; Victoria busy: 13:30-14:00, 14:30-15:30, 16:30-17:00
    (busy victoria t_13_30)
    (busy victoria t_14_30) (busy victoria t_15_00)
    (busy victoria t_16_30)

    ;; Nancy busy: 9:00-14:00, 14:30-15:30
    (busy nancy t_9_00) (busy nancy t_9_30) (busy nancy t_10_00) (busy nancy t_10_30)
    (busy nancy t_11_00) (busy nancy t_11_30) (busy nancy t_12_00) (busy nancy t_12_30)
    (busy nancy t_13_00) (busy nancy t_13_30)
    (busy nancy t_14_30) (busy nancy t_15_00)

    ;; Emily is free the entire day (no busy facts)

    ;; meeting initially unscheduled
    (meeting_unscheduled)
  )
  ;; The task requests the earliest available 30-min slot that fits everyone's calendar.
  ;; Given the inputs, the earliest feasible slot is 14:00.
  (:goal (meeting_at t_14_00))
)