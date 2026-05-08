(define (problem schedule_meeting_problem)
  (:domain schedule_meeting)

  (:objects
    albert gregory benjamin - person
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30 t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - time_slot
  )

  (:init
    ;; Albert's busy slots (9:30-10:30, 12:00-12:30, 14:00-14:30, 15:00-15:30, 16:30-17:00)
    (busy albert t_09_30)
    (busy albert t_10_00)
    (busy albert t_12_00)
    (busy albert t_14_00)
    (busy albert t_15_00)
    (busy albert t_16_30)

    ;; Gregory's busy slots (11:00-11:30, 12:30-13:00, 13:30-14:00, 15:30-16:00)
    (busy gregory t_11_00)
    (busy gregory t_12_30)
    (busy gregory t_13_30)
    (busy gregory t_15_30)

    ;; Benjamin's blocked slots (9:30-10:00, 10:30-11:00, 11:30-13:30, 14:00-15:00, 15:30-16:00, 16:30-17:00)
    (busy benjamin t_09_30)
    (busy benjamin t_10_30)
    (busy benjamin t_11_30)
    (busy benjamin t_12_00)
    (busy benjamin t_12_30)
    (busy benjamin t_13_00)
    (busy benjamin t_14_00)
    (busy benjamin t_14_30)
    (busy benjamin t_15_30)
    (busy benjamin t_16_30)
  )

  ;; The group requests the earliest common half-hour slot; given the schedules,
  ;; the earliest common free slot is 9:00 (t_09_00).
  (:goal (and
    (meeting_at t_09_00)
  ))
)