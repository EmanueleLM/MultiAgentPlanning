(define (problem common-meeting-schedule)
    (:domain calendar-scheduling)
    (:objects
        t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time-slot
    )

    (:init
        ; Time links (30-minute intervals from 9:00 (t0) to 17:00 (end of t15))
        (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4) (next t4 t5)
        (next t5 t6) (next t6 t7) (next t7 t8) (next t8 t9) (next t9 t10)
        (next t10 t11) (next t11 t12) (next t12 t13) (next t13 t14) (next t14 t15)

        ; Stephen Available (T: t0, t1, t3, t4, t5, t6, t7, t9, t10, t12, t13, t15)
        (is-available stephen t0) (is-available stephen t1) 
        (is-available stephen t3) (is-available stephen t4) (is-available stephen t5)
        (is-available stephen t6) (is-available stephen t7) 
        (is-available stephen t9) (is-available stephen t10) 
        (is-available stephen t12) (is-available stephen t13) 
        (is-available stephen t15)

        ; Edward Available (T: t1, t3, t4, t5, t6, t7, t8, t11, t14, t15)
        (is-available edward t1) 
        (is-available edward t3) (is-available edward t4) (is-available edward t5)
        (is-available edward t6) (is-available edward t7) (is-available edward t8) 
        (is-available edward t11) 
        (is-available edward t14) (is-available edward t15)

        ; Angela Available (T: t5, t6, t8, t13)
        (is-available angela t5) (is-available angela t6) 
        (is-available angela t8) 
        (is-available angela t13)
    )

    (:goal (exists (?t - time-slot) (meeting-scheduled ?t)))
)