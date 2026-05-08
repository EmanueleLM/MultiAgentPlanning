(define (problem calendarschedulingexample19)
    (:domain calendar_scheduling)
    (:objects
        stephen edward angela - person
        ; Time points represent the start of a 30-minute interval
        ; t0 = 9:00, t1 = 9:30, ..., t14 = 16:00, t15 = 16:30
        t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time_point
    )
    (:init
        ; Define next_time relations for all consecutive 30-minute intervals
        (next_time t0 t1) (next_time t1 t2) (next_time t2 t3) (next_time t3 t4)
        (next_time t4 t5) (next_time t5 t6) (next_time t6 t7) (next_time t7 t8)
        (next_time t8 t9) (next_time t9 t10) (next_time t10 t11) (next_time t11 t12)
        (next_time t12 t13) (next_time t13 t14) (next_time t14 t15)

        ; Initialize everyone as available for all potential 30-minute slots
        ; A 1-hour meeting consists of two consecutive 30-minute slots.
        ; The latest possible start for a 1-hour meeting is t14 (16:00-17:00).
        ; So, t15 (16:30-17:00) is the latest mid_slot for such a meeting.

        ; Stephen's initial availability
        (available stephen t0) (available stephen t1) (available stephen t2) (available stephen t3)
        (available stephen t4) (available stephen t5) (available stephen t6) (available stephen t7)
        (available stephen t8) (available stephen t9) (available stephen t10) (available stephen t11)
        (available stephen t12) (available stephen t13) (available stephen t14) (available stephen t15)

        ; Edward's initial availability
        (available edward t0) (available edward t1) (available edward t2) (available edward t3)
        (available edward t4) (available edward t5) (available edward t6) (available edward t7)
        (available edward t8) (available edward t9) (available edward t10) (available edward t11)
        (available edward t12) (available edward t13) (available edward t14) (available edward t15)

        ; Angela's initial availability
        (available angela t0) (available angela t1) (available angela t2) (available angela t3)
        (available angela t4) (available angela t5) (available angela t6) (available angela t7)
        (available angela t8) (available angela t9) (available angela t10) (available angela t11)
        (available angela t12) (available angela t13) (available angela t14) (available angela t15)

        ; Apply busy schedules (marking slots as not available)

        ; Stephen's busy schedule: 10:00-10:30, 13:00-13:30, 14:30-15:00, 16:00-16:30
        (not (available stephen t2))  ; 10:00-10:30
        (not (available stephen t8))  ; 13:00-13:30
        (not (available stephen t11)) ; 14:30-15:00
        (not (available stephen t14)) ; 16:00-16:30

        ; Edward's busy schedule: 9:00-9:30, 10:00-10:30, 13:30-14:30, 15:00-16:00
        (not (available edward t0))  ; 9:00-9:30
        (not (available edward t2))  ; 10:00-10:30
        (not (available edward t9))  ; 13:30-14:00
        (not (available edward t10)) ; 14:00-14:30
        (not (available edward t12)) ; 15:00-15:30
        (not (available edward t13)) ; 15:30-16:00

        ; Angela's busy schedule: 9:00-11:30, 12:30-13:00, 13:30-15:30, 16:00-17:00
        (not (available angela t0))  ; 9:00-9:30
        (not (available angela t1))  ; 9:30-10:00
        (not (available angela t2))  ; 10:00-10:30
        (not (available angela t3))  ; 10:30-11:00
        (not (available angela t4))  ; 11:00-11:30
        (not (available angela t7))  ; 12:30-13:00
        (not (available angela t9))  ; 13:30-14:00
        (not (available angela t10)) ; 14:00-14:30
        (not (available angela t11)) ; 14:30-15:00
        (not (available angela t12)) ; 15:00-15:30
        (not (available angela t14)) ; 16:00-16:30
        (not (available angela t15)) ; 16:30-17:00
    )
    (:goal (exists (?t - time_point) (meeting_scheduled ?t)))
)