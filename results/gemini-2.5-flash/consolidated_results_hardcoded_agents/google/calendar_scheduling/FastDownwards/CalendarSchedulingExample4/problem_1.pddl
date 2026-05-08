(define (problem schedule_meeting_monday)
    (:domain calendar_scheduling)
    (:objects
        t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 - time_slot
    )
    (:init
        ; Donna's Availability (Busy: t11, t14)
        (available_donna t1) (available_donna t2) (available_donna t3) (available_donna t4)
        (available_donna t5) (available_donna t6) (available_donna t7) (available_donna t8)
        (available_donna t9) (available_donna t10)
        (available_donna t12) (available_donna t13)
        (available_donna t15) (available_donna t16)

        ; John's Availability (Busy: t5, t16)
        (available_john t1) (available_john t2) (available_john t3) (available_john t4)
        (available_john t6) (available_john t7) (available_john t8) (available_john t9)
        (available_john t10) (available_john t11) (available_john t12) (available_john t13)
        (available_john t14) (available_john t15)

        ; Billy's Availability (Available: t3, t11)
        (available_billy t3)
        (available_billy t11)
    )
    (:goal (meeting_scheduled t3))
)