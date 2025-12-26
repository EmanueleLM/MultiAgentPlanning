(define (problem schedule-meeting-6)
    (:domain calendar-scheduling)
    (:objects
        T0 T1 T2 T3 T4 T5 T6 T7 T8 T9 T10 T11 T12 T13 T14 T15 T16 - time-point
    )

    (:init
        (= (total-cost) 0)

        ; Time point definitions (T0=9:00, T16=17:00, 30 min increments)
        (next-time T0 T1) (next-time T1 T2) (next-time T2 T3) (next-time T3 T4)
        (next-time T4 T5) (next-time T5 T6) (next-time T6 T7) (next-time T7 T8)
        (next-time T8 T9) (next-time T9 T10) (next-time T10 T11) (next-time T11 T12)
        (next-time T12 T13) (next-time T13 T14) (next-time T14 T15) (next-time T15 T16)

        ; Time values for minimizing cost (0 = 9:00, 16 = 17:00)
        (= (time-value T0) 0) (= (time-value T1) 1) (= (time-value T2) 2)
        (= (time-value T3) 3) (= (time-value T4) 4) (= (time-value T5) 5)
        (= (time-value T6) 6) (= (time-value T7) 7) (= (time-value T8) 8)
        (= (time-value T9) 9) (= (time-value T10) 10) (= (time-value T11) 11)
        (= (time-value T12) 12) (= (time-value T13) 13) (= (time-value T14) 14)
        (= (time-value T15) 15) (= (time-value T16) 16)

        ; --- Thomas Availability (Available 9:00 to 17:00) ---
        (is-available thomas T0 T2) (is-available thomas T1 T3) (is-available thomas T2 T4) 
        (is-available thomas T3 T5) (is-available thomas T4 T6) (is-available thomas T5 T7) 
        (is-available thomas T6 T8) (is-available thomas T7 T9) (is-available thomas T8 T10) 
        (is-available thomas T9 T11) (is-available thomas T10 T12) (is-available thomas T11 T13) 
        (is-available thomas T12 T14) (is-available thomas T13 T15) (is-available thomas T14 T16) 

        ; --- Dylan Availability (Blocked 10:30-11:00 (T3-T4) & 13:30-14:00 (T9-T10)) ---
        (is-available dylan T0 T2) (is-available dylan T1 T3)
        (is-available dylan T4 T6) (is-available dylan T5 T7) 
        (is-available dylan T6 T8) (is-available dylan T7 T9) 
        (is-available dylan T10 T12) (is-available dylan T11 T13) 
        (is-available dylan T12 T14) (is-available dylan T13 T15) (is-available dylan T14 T16) 

        ; --- Jerry Availability (Blocked 9:00-11:00 (T0-T4), 11:30-14:30 (T5-T11), 16:00-17:00 (T14-T16)) ---
        ; Available slots: 14:30-15:30 (T11-T13), 15:00-16:00 (T12-T14)
        (is-available jerry T11 T13)
        (is-available jerry T12 T14)
    )

    (:goal (exists (?t_start - time-point ?t_end - time-point)
                (meeting-scheduled ?t_start ?t_end)
           )
    )

    (:metric minimize (total-cost))
)