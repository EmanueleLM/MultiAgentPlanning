(define (problem calendar_scheduling_example_8_problem)
    (:domain calendar_scheduling_example_8)
    (:objects
        adam jerry matthew - person
        t9_00 t9_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
        t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time_slot
    )
    (:init
        ; Define persons
        (is_person adam)
        (is_person jerry)
        (is_person matthew)

        ; Define all 30-minute time slots between 9:00 and 17:00
        (is_time_slot t9_00)
        (is_time_slot t9_30)
        (is_time_slot t10_00)
        (is_time_slot t10_30)
        (is_time_slot t11_00)
        (is_time_slot t11_30)
        (is_time_slot t12_00)
        (is_time_slot t12_30)
        (is_time_slot t13_00)
        (is_time_slot t13_30)
        (is_time_slot t14_00)
        (is_time_slot t14_30)
        (is_time_slot t15_00)
        (is_time_slot t15_30)
        (is_time_slot t16_00)
        (is_time_slot t16_30)

        ; Adam's busy schedule on Monday (9:00 to 17:00)
        ; 10:00-10:30 -> t10_00
        ; 12:30-13:00 -> t12_30
        ; 13:30-14:30 -> t13_30, t14_00
        (busy adam t10_00)
        (busy adam t12_30)
        (busy adam t13_30)
        (busy adam t14_00)

        ; Jerry's busy schedule on Monday (9:00 to 17:00)
        ; 9:00-9:30 -> t9_00
        ; 12:00-12:30 -> t12_00
        ; 15:00-16:00 -> t15_00, t15_30
        (busy jerry t9_00)
        (busy jerry t12_00)
        (busy jerry t15_00)
        (busy jerry t15_30)

        ; Matthew's busy schedule on Monday (9:00 to 17:00)
        ; 9:30-11:00 -> t9_30, t10_00, t10_30
        ; 11:30-12:30 -> t11_30, t12_00
        ; 13:00-14:00 -> t13_00, t13_30
        ; 14:30-17:00 -> t14_30, t15_00, t15_30, t16_00, t16_30
        (busy matthew t9_30)
        (busy matthew t10_00)
        (busy matthew t10_30)
        (busy matthew t11_30)
        (busy matthew t12_00)
        (busy matthew t13_00)
        (busy matthew t13_30)
        (busy matthew t14_30)
        (busy matthew t15_00)
        (busy matthew t15_30)
        (busy matthew t16_00)
        (busy matthew t16_30)
    )
    (:goal (or
        (meeting_scheduled t9_00)
        (meeting_scheduled t9_30)
        (meeting_scheduled t10_00)
        (meeting_scheduled t10_30)
        (meeting_scheduled t11_00)
        (meeting_scheduled t11_30)
        (meeting_scheduled t12_00)
        (meeting_scheduled t12_30)
        (meeting_scheduled t13_00)
        (meeting_scheduled t13_30)
        (meeting_scheduled t14_00)
        (meeting_scheduled t14_30)
        (meeting_scheduled t15_00)
        (meeting_scheduled t15_30)
        (meeting_scheduled t16_00)
        (meeting_scheduled t16_30)
    ))
)