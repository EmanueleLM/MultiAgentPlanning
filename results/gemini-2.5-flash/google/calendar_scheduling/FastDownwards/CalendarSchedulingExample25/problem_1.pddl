(define (problem calendar_scheduling_example25)
    (:domain calendar_scheduling)
    (:objects
        anthony pamela zachary - person
        t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30 t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time_point
    )
    (:init
        ; Define all valid 30-minute time slot start points within the 9:00-17:00 window
        (is_30min_slot t09_00) (is_30min_slot t09_30) (is_30min_slot t10_00) (is_30min_slot t10_30)
        (is_30min_slot t11_00) (is_30min_slot t11_30) (is_30min_slot t12_00) (is_30min_slot t12_30)
        (is_30min_slot t13_00) (is_30min_slot t13_30) (is_30min_slot t14_00) (is_30min_slot t14_30)
        (is_30min_slot t15_00) (is_30min_slot t15_30) (is_30min_slot t16_00) (is_30min_slot t16_30)

        ; Define next_30min_slot connections for 1-hour meeting duration
        (next_30min_slot t09_00 t09_30)
        (next_30min_slot t09_30 t10_00)
        (next_30min_slot t10_00 t10_30)
        (next_30min_slot t10_30 t11_00)
        (next_30min_slot t11_00 t11_30)
        (next_30min_slot t11_30 t12_00)
        (next_30min_slot t12_00 t12_30)
        (next_30min_slot t12_30 t13_00)
        (next_30min_slot t13_00 t13_30)
        (next_30min_slot t13_30 t14_00)
        (next_30min_slot t14_00 t14_30)
        (next_30min_slot t14_30 t15_00)
        (next_30min_slot t15_00 t15_30)
        (next_30min_slot t15_30 t16_00)
        (next_30min_slot t16_00 t16_30) ; A meeting starting at t16_00 and ending at t17_00

        ; Anthony's initial availability (9:00-17:00)
        ; Busy: 9:30-10:00, 12:00-13:00, 16:00-16:30
        (available anthony t09_00)
        ;(available anthony t09_30) ; Busy
        (available anthony t10_00)
        (available anthony t10_30)
        (available anthony t11_00)
        (available anthony t11_30)
        ;(available anthony t12_00) ; Busy
        ;(available anthony t12_30) ; Busy
        (available anthony t13_00)
        (available anthony t13_30)
        (available anthony t14_00)
        (available anthony t14_30)
        (available anthony t15_00)
        (available anthony t15_30)
        ;(available anthony t16_00) ; Busy
        (available anthony t16_30)

        ; Pamela's initial availability (9:00-17:00)
        ; Busy: 9:30-10:00, 16:30-17:00
        (available pamela t09_00)
        ;(available pamela t09_30) ; Busy
        (available pamela t10_00)
        (available pamela t10_30)
        (available pamela t11_00)
        (available pamela t11_30)
        (available pamela t12_00)
        (available pamela t12_30)
        (available pamela t13_00)
        (available pamela t13_30)
        (available pamela t14_00)
        (available pamela t14_30)
        (available pamela t15_00)
        (available pamela t15_30)
        (available pamela t16_00)
        ;(available pamela t16_30) ; Busy

        ; Zachary's initial availability (9:00-17:00)
        ; Busy: 9:00-11:30, 12:00-12:30, 13:00-13:30, 14:30-15:00, 16:00-17:00
        ;(available zachary t09_00) ; Busy
        ;(available zachary t09_30) ; Busy
        ;(available zachary t10_00) ; Busy
        ;(available zachary t10_30) ; Busy
        ;(available zachary t11_00) ; Busy
        (available zachary t11_30)
        ;(available zachary t12_00) ; Busy
        (available zachary t12_30)
        ;(available zachary t13_00) ; Busy
        (available zachary t13_30)
        (available zachary t14_00)
        ;(available zachary t14_30) ; Busy
        (available zachary t15_00)
        (available zachary t15_30)
        ;(available zachary t16_00) ; Busy
        ;(available zachary t16_30) ; Busy

        ; Pamela's preference constraint: "I do not want to meet on Monday after 14:30."
        ; This means a 1-hour meeting must *start* at or before 14:30.
        (pamela_prefers_meeting_start_at t09_00)
        (pamela_prefers_meeting_start_at t09_30)
        (pamela_prefers_meeting_start_at t10_00)
        (pamela_prefers_meeting_start_at t10_30)
        (pamela_prefers_meeting_start_at t11_00)
        (pamela_prefers_meeting_start_at t11_30)
        (pamela_prefers_meeting_start_at t12_00)
        (pamela_prefers_meeting_start_at t12_30)
        (pamela_prefers_meeting_start_at t13_00)
        (pamela_prefers_meeting_start_at t13_30)
        (pamela_prefers_meeting_start_at t14_00)
        (pamela_prefers_meeting_start_at t14_30)
        ; Pamela does NOT prefer any meeting starting at t15_00 or later.
    )
    (:goal (exists (?s1 ?s2 - time_point) (meeting_scheduled ?s1 ?s2)))
)