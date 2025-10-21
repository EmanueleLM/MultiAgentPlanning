(define (problem schedule-monday-meeting)
  (:domain meeting-scheduling)
  ;; Discrete 30-minute slots from 09:00-09:30 (t0) through 16:30-17:00 (t15).
  (:objects
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - slot
  )
  (:init
    ;; Slot existence
    (slot t0) (slot t1) (slot t2) (slot t3) (slot t4) (slot t5)
    (slot t6) (slot t7) (slot t8) (slot t9) (slot t10) (slot t11)
    (slot t12) (slot t13) (slot t14) (slot t15)

    ;; Consecutive-slot relations (30-minute granularity)
    (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4)
    (next t4 t5) (next t5 t6) (next t6 t7) (next t7 t8)
    (next t8 t9) (next t9 t10) (next t10 t11) (next t11 t12)
    (next t12 t13) (next t13 t14) (next t14 t15)

    ;; Participant availabilities (free-* predicates) as reported
    ;; Madison: 09:00-09:30 (t0), 10:00-11:30 (t2,t3,t4), 12:00-17:00 (t6..t15)
    (free-madison t0) (free-madison t2) (free-madison t3) (free-madison t4)
    (free-madison t6) (free-madison t7) (free-madison t8) (free-madison t9)
    (free-madison t10) (free-madison t11) (free-madison t12) (free-madison t13)
    (free-madison t14) (free-madison t15)

    ;; Diana: 09:00-11:00 (t0,t1,t2,t3), 11:30-13:00 (t5,t6,t7), 13:30-17:00 (t9..t15)
    (free-diana t0) (free-diana t1) (free-diana t2) (free-diana t3)
    (free-diana t5) (free-diana t6) (free-diana t7)
    (free-diana t9) (free-diana t10) (free-diana t11) (free-diana t12)
    (free-diana t13) (free-diana t14) (free-diana t15)

    ;; Shirley: 12:00-13:30 (t6,t7,t8), 15:00-15:30 (t12)
    (free-shirley t6) (free-shirley t7) (free-shirley t8) (free-shirley t12)
  )

  ;; Goal: produce a schedule (one action that makes (scheduled) true).
  (:goal (scheduled))
)