(define (problem calendar-scheduling-example36-instance)
    (:domain calendar-scheduling-example36)
    (:objects
        ryan ruth denise - person
        t9_00 t9_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30 t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time_slot
    )
    (:init
        ; All persons initially available for all slots
        (available ryan t9_00) (available ryan t9_30) (available ryan t10_00) (available ryan t10_30) (available ryan t11_00) (available ryan t11_30) (available ryan t12_00) (available ryan t12_30) (available ryan t13_00) (available ryan t13_30) (available ryan t14_00) (available ryan t14_30) (available ryan t15_00) (available ryan t15_30) (available ryan t16_00) (available ryan t16_30)
        (available ruth t9_00) (available ruth t9_30) (available ruth t10_00) (available ruth t10_30) (available ruth t11_00) (available ruth t11_30) (available ruth t12_00) (available ruth t12_30) (available ruth t13_00) (available ruth t13_30) (available ruth t14_00) (available ruth t14_30) (available ruth t15_00) (available ruth t15_30) (available ruth t16_00) (available ruth t16_30)
        (available denise t9_00) (available denise t9_30) (available denise t10_00) (available denise t10_30) (available denise t11_00) (available denise t11_30) (available denise t12_00) (available denise t12_30) (available denise t13_00) (available denise t13_30) (available denise t14_00) (available denise t14_30) (available denise t15_00) (available denise t15_30) (available denise t16_00) (available denise t16_30)

        ; Ryan's busy schedule
        (not (available ryan t9_00))
        (not (available ryan t12_30))

        ; Ruth has no meetings the whole day, so no (not (available ruth ...))

        ; Denise's busy schedule
        (not (available denise t9_30))
        (not (available denise t10_00))
        (not (available denise t12_00))
        (not (available denise t12_30))
        (not (available denise t14_30))
        (not (available denise t15_00))
        (not (available denise t15_30))
        (not (available denise t16_00))

        ; Next slot relations
        (next_slot t9_00 t9_30)
        (next_slot t9_30 t10_00)
        (next_slot t10_00 t10_30)
        (next_slot t10_30 t11_00)
        (next_slot t11_00 t11_30)
        (next_slot t11_30 t12_00)
        (next_slot t12_00 t12_30)
        (next_slot t12_30 t13_00)
        (next_slot t13_00 t13_30)
        (next_slot t13_30 t14_00)
        (next_slot t14_00 t14_30)
        (next_slot t14_30 t15_00)
        (next_slot t15_00 t15_30)
        (next_slot t15_30 t16_00)
        (next_slot t16_00 t16_30)

        ; Denise's preference: do not want to meet on Monday after 12:30.
        ; This means the meeting must end by 12:30.
        ; A 1-hour meeting ends by 12:30 if it starts at t11_30 or earlier.
        (denise_can_start_meeting_at t9_00)
        (denise_can_start_meeting_at t9_30)
        (denise_can_start_meeting_at t10_00)
        (denise_can_start_meeting_at t10_30)
        (denise_can_start_meeting_at t11_00)
        (denise_can_start_meeting_at t11_30)

        (not (denise_can_start_meeting_at t12_00))
        (not (denise_can_start_meeting_at t12_30))
        (not (denise_can_start_meeting_at t13_00))
        (not (denise_can_start_meeting_at t13_30))
        (not (denise_can_start_meeting_at t14_00))
        (not (denise_can_start_meeting_at t14_30))
        (not (denise_can_start_meeting_at t15_00))
        (not (denise_can_start_meeting_at t15_30))
        (not (denise_can_start_meeting_at t16_00))
    )
    (:goal (exists (?ts - time_slot) (meeting_scheduled_at ?ts)))
)