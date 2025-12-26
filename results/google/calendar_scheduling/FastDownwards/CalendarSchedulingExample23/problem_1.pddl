(define (problem MeetingSchedulingP1)
    (:domain CalendarScheduling)
    (:objects
        t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time
    )
    (:init
        ; Billy availability
        (is-available billy t1) (is-available billy t2) (is-available billy t3) (is-available billy t4)
        (is-available billy t7) (is-available billy t13)

        ; Maria availability
        (is-available maria t4) (is-available maria t5) (is-available maria t6) (is-available maria t7)
        (is-available maria t12) (is-available maria t13) (is-available maria t14) (is-available maria t15)

        ; William availability
        (is-available william t3) (is-available william t4) (is-available william t5) (is-available william t8)
    )
    (:goal (and
        (is-goal-achieved)
    ))
)