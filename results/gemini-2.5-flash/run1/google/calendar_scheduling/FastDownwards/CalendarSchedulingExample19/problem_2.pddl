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

        ; Stephen's availability (free slots after applying busy schedule)
        (available stephen t0)
        (available stephen t1)
        (available stephen t3)
        (available stephen t4)
        (available stephen t5)
        (available stephen t6)
        (available stephen t7)
        (available stephen t9)
        (available stephen t10)
        (available stephen t12)
        (available stephen t13)
        (available stephen t15)

        ; Edward's availability (free slots after applying busy schedule)
        (available edward t1)
        (available edward t3)
        (available edward t4)
        (available edward t5)
        (available edward t6)
        (available edward t7)
        (available edward t8)
        (available edward t11)
        (available edward t14)
        (available edward t15)

        ; Angela's availability (free slots after applying busy schedule)
        (available angela t5)
        (available angela t6)
        (available angela t8)
        (available angela t13)
    )
    (:goal (exists (?t - time_point) (meeting_scheduled ?t)))
)