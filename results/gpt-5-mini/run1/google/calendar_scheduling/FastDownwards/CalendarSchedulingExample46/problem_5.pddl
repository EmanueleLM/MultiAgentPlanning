(define (problem schedule_meeting_arthur_theresa_carl_monday)
  (:domain calendar_scheduling_example46)

  (:objects
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - timeslot
  )

  (:init
    ;; Arthur busy slots (9:30-10:00, 14:00-14:30)
    (busy_at arthur t_09_30)
    (busy_at arthur t_14_00)

    ;; Theresa busy slots (9:00-9:30, 12:00-13:00, 15:00-16:30)
    (busy_at theresa t_09_00)
    (busy_at theresa t_12_00)
    (busy_at theresa t_12_30)
    (busy_at theresa t_15_00)
    (busy_at theresa t_15_30)
    (busy_at theresa t_16_00)

    ;; Carl busy slots (9:00-11:30, 12:00-14:00, 14:30-17:00)
    (busy_at carl t_09_00)
    (busy_at carl t_09_30)
    (busy_at carl t_10_00)
    (busy_at carl t_10_30)
    (busy_at carl t_11_00)
    (busy_at carl t_12_00)
    (busy_at carl t_12_30)
    (busy_at carl t_13_00)
    (busy_at carl t_14_30)
    (busy_at carl t_15_00)
    (busy_at carl t_15_30)
    (busy_at carl t_16_00)
    (busy_at carl t_16_30)
  )

  ;; Goal: schedule the meeting at a feasible timeslot. The known feasible solution is 11:30.
  (:goal (meeting_at t_11_30))
)