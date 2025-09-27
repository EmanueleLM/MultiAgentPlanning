(define (problem schedule-monday-30)
  (:domain meeting-scheduling)

  ;; time discretization: t0=09:00, t1=09:30, t2=10:00, t3=10:30, t4=11:00,
  ;; t5=11:30, t6=12:00, t7=12:30, t8=13:00, t9=13:30, t10=14:00, t11=14:30,
  ;; t12=15:00, t13=15:30, t14=16:00, t15=16:30

  (:objects
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - timepoint
  )

  (:init
    ;; declare timepoints
    (timepoint t0) (timepoint t1) (timepoint t2) (timepoint t3)
    (timepoint t4) (timepoint t5) (timepoint t6) (timepoint t7)
    (timepoint t8) (timepoint t9) (timepoint t10) (timepoint t11)
    (timepoint t12) (timepoint t13) (timepoint t14) (timepoint t15)

    ;; AVAILABLE start times per participant (computed from given busy intervals).
    ;; michael busy at 10:30-11:00 (blocks t3) and 14:30-15:00 (blocks t11)
    ;; available: t0,t1,t2,t4,t5,t6,t7,t8,t9,t10,t12,t13,t14,t15
    (available-michael t0) (available-michael t1) (available-michael t2)
    (available-michael t4) (available-michael t5) (available-michael t6)
    (available-michael t7) (available-michael t8) (available-michael t9)
    (available-michael t10) (available-michael t12) (available-michael t13)
    (available-michael t14) (available-michael t15)

    ;; samuel busy at 10:30-11:00 (t3), 12:30-13:00 (t7), 13:30-14:30 (t9,t10),
    ;; 15:30-16:00 (t13), 16:30-17:00 (t15)
    ;; available: t0,t1,t2,t4,t5,t6,t8,t11,t12,t14
    (available-samuel t0) (available-samuel t1) (available-samuel t2)
    (available-samuel t4) (available-samuel t5) (available-samuel t6)
    (available-samuel t8) (available-samuel t11) (available-samuel t12)
    (available-samuel t14)

    ;; aaron busy at 11:00-11:30 (t4), 12:30-13:00 (t7), 13:30-14:00 (t9),
    ;; 15:00-15:30 (t12), 16:00-17:00 (t14,t15)
    ;; available: t0,t1,t2,t3,t5,t6,t8,t10,t11,t13
    (available-aaron t0) (available-aaron t1) (available-aaron t2)
    (available-aaron t3) (available-aaron t5) (available-aaron t6)
    (available-aaron t8) (available-aaron t10) (available-aaron t11)
    (available-aaron t13)

    ;; judith busy at 09:00-09:30 (t0), 10:30-11:30 (t3,t4), 12:00-12:30 (t6),
    ;; 14:00-15:00 (t10,t11), 15:30-16:00 (t13), 16:30-17:00 (t15)
    ;; available: t1,t2,t5,t7,t8,t9,t12,t14
    (available-judith t1) (available-judith t2) (available-judith t5)
    (available-judith t7) (available-judith t8) (available-judith t9)
    (available-judith t12) (available-judith t14)

    ;; kevin busy at 09:00-11:00 (t0,t1,t2), 11:30-13:00 (t5,t6,t7),
    ;; 13:30-14:00 (t9), 14:30-15:00 (t11), 15:30-16:00 (t13)
    ;; available: t4,t8,t10,t12,t14,t15
    (available-kevin t4) (available-kevin t8) (available-kevin t10)
    (available-kevin t12) (available-kevin t14) (available-kevin t15)
  )

  ;; Goal: schedule at the earliest feasible start: t8 (13:00).
  (:goal (and (scheduled t8)))
)