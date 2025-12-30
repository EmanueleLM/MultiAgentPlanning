(define (problem schedule-meeting-16)
    (:domain calendar-scheduling-v16)
    (:objects
        T0 T1 T2 T3 T4 T5 T6 T7 T8 T9 T10 T11 T12 T13 T14 T15 - time-slot
    )

    (:init
        ;; Time slot mapping: T0=9:00, T15=16:30. All slots are 30 minutes.

        ;; --- Scott's Availability (Busy: T1, T2, T9, T11, T13, T15 based on specification) ---
        (is-available scott T0) (is-available scott T3)
        (is-available scott T4) (is-available scott T5) (is-available scott T6)
        (is-available scott T7) (is-available scott T8) (is-available scott T10)
        (is-available scott T12) (is-available scott T14)

        ;; --- Gabriel's Availability (Busy: None) ---
        (is-available gabriel T0) (is-available gabriel T1) (is-available gabriel T2)
        (is-available gabriel T3) (is-available gabriel T4) (is-available gabriel T5)
        (is-available gabriel T6) (is-available gabriel T7) (is-available gabriel T8)
        (is-available gabriel T9) (is-available gabriel T10) (is-available gabriel T11)
        (is-available gabriel T12) (is-available gabriel T13) (is-available gabriel T14)
        (is-available gabriel T15)

        ;; --- Christine's Availability (Available: T2, T7) ---
        (is-available christine T2) (is-available christine T7)
    )

    (:goal (goal-achieved))
)