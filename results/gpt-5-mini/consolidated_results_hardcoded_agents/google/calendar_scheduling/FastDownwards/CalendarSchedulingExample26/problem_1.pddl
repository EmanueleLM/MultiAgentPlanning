(define (problem schedule-monday-meeting)
  (:domain calendar-scheduling)
  (:objects
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - timeslot
  )
  (:init
    ;; consecutive half-hour slots from 09:00..16:30 (t0..t15)
    (consecutive t0 t1) (consecutive t1 t2) (consecutive t2 t3) (consecutive t3 t4)
    (consecutive t4 t5) (consecutive t5 t6) (consecutive t6 t7) (consecutive t7 t8)
    (consecutive t8 t9) (consecutive t9 t10) (consecutive t10 t11) (consecutive t11 t12)
    (consecutive t12 t13) (consecutive t13 t14) (consecutive t14 t15)

    ;; Katherine is available all half-hour slots 09:00-17:00
    (available katherine t0) (available katherine t1) (available katherine t2) (available katherine t3)
    (available katherine t4) (available katherine t5) (available katherine t6) (available katherine t7)
    (available katherine t8) (available katherine t9) (available katherine t10) (available katherine t11)
    (available katherine t12) (available katherine t13) (available katherine t14) (available katherine t15)

    ;; Nicole is available all half-hour slots 09:00-17:00
    (available nicole t0) (available nicole t1) (available nicole t2) (available nicole t3)
    (available nicole t4) (available nicole t5) (available nicole t6) (available nicole t7)
    (available nicole t8) (available nicole t9) (available nicole t10) (available nicole t11)
    (available nicole t12) (available nicole t13) (available nicole t14) (available nicole t15)

    ;; Kevin's free half-hour slots within 09:00-17:00 given busy intervals:
    ;; Busy: 09:00-10:00 => blocks t0,t1
    ;; Busy: 10:30-11:30 => blocks t3,t4
    ;; Busy: 12:00-15:30 => blocks t6,t7,t8,t9,t10,t11,t12
    ;; Busy: 16:30-17:00 => blocks t15
    ;; Therefore Kevin available: t2 (10:00-10:30), t5 (11:30-12:00), t13 (15:30-16:00), t14 (16:00-16:30)
    (available kevin t2) (available kevin t5) (available kevin t13) (available kevin t14)
  )
  (:goal (and (scheduled)))
)