(define (problem calendar_problem_4)
  (:domain calendar_scheduling)
  (:objects
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - timeslot
  )
  (:init
    ;; Timeslot mapping:
    ;; t0: 09:00-09:30, t1: 09:30-10:00, t2: 10:00-10:30, t3: 10:30-11:00,
    ;; t4: 11:00-11:30, t5: 11:30-12:00, t6: 12:00-12:30, t7: 12:30-13:00,
    ;; t8: 13:00-13:30, t9: 13:30-14:00, t10: 14:00-14:30, t11: 14:30-15:00,
    ;; t12: 15:00-15:30, t13: 15:30-16:00, t14: 16:00-16:30, t15: 16:30-17:00

    ;; Donna is busy on Monday during 14:00 to 14:30 (t10), 15:30 to 16:00 (t13).
    ;; Donna is free at:
    (free donna t0) (free donna t1) (free donna t2) (free donna t3)
    (free donna t4) (free donna t5) (free donna t6) (free donna t7)
    (free donna t8) (free donna t9) (free donna t11) (free donna t12)
    (free donna t14) (free donna t15)

    ;; John is busy on Monday during 11:00 to 11:30 (t4), 16:30 to 17:00 (t15).
    ;; John is free at:
    (free john t0) (free john t1) (free john t2) (free john t3)
    (free john t5) (free john t6) (free john t7) (free john t8)
    (free john t9) (free john t10) (free john t11) (free john t12)
    (free john t13) (free john t14)

    ;; Billy is busy on Monday during 9:00 to 10:00 (t0, t1), 
    ;; 10:30 to 14:00 (t3, t4, t5, t6, t7, t8, t9), 14:30 to 17:00 (t11, t12, t13, t14, t15).
    ;; Billy is free only at:
    (free billy t2)
    (free billy t10)

    ;; Meeting scheduled status
    ;; (not (meeting_scheduled))
  )
  (:goal (meeting_scheduled))
)