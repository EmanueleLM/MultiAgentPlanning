(define (problem schedule-monday-meeting)
  (:domain meeting-scheduling)
  ;; Discrete 30-minute slots from 09:00-09:30 (t0) through 16:30-17:00 (t15).
  ;; Mapping:
  ;; t0=09:00-09:30, t1=09:30-10:00, t2=10:00-10:30, t3=10:30-11:00,
  ;; t4=11:00-11:30, t5=11:30-12:00, t6=12:00-12:30, t7=12:30-13:00,
  ;; t8=13:00-13:30, t9=13:30-14:00, t10=14:00-14:30, t11=14:30-15:00,
  ;; t12=15:00-15:30, t13=15:30-16:00, t14=16:00-16:30, t15=16:30-17:00.
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

    ;; Participant availabilities (free-* predicates) derived from their busy intervals.
    ;; Madison free intervals: 09:00-09:30, 10:00-11:30, 12:00-17:00
    (free-madison t0)
    (free-madison t2) (free-madison t3) (free-madison t4)
    (free-madison t6) (free-madison t7) (free-madison t8) (free-madison t9)
    (free-madison t10) (free-madison t11) (free-madison t12) (free-madison t13)
    (free-madison t14) (free-madison t15)

    ;; Diana free intervals: 09:00-11:00, 11:30-13:00, 13:30-17:00
    (free-diana t0) (free-diana t1) (free-diana t2) (free-diana t3)
    (free-diana t5) (free-diana t6) (free-diana t7)
    (free-diana t9) (free-diana t10) (free-diana t11) (free-diana t12)
    (free-diana t13) (free-diana t14) (free-diana t15)

    ;; Shirley free intervals: 12:00-13:30, 15:00-15:30
    (free-shirley t6) (free-shirley t7) (free-shirley t8)
    (free-shirley t12)
  )

  ;; Goal: produce a schedule (one action that makes (scheduled) true).
  (:goal (scheduled))
)