(define (problem calendar_scheduling_example_23)
    (:domain calendar_scheduling)
    (:objects
        billy maria william - person
        t09_00 t09_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30 t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - time_point
    )
    (:init
        ;; Define temporal sequence of 30-minute slots (from 9:00 to 17:00)
        ;; A 1-hour meeting starts at ?start_time and occupies ?start_time and ?next_slot_time.
        ;; The latest possible ?start_time is t16_00, which combined with t16_30 ends the meeting at 17:00.
        (next-slot t09_00 t09_30)
        (next-slot t09_30 t10_00)
        (next-slot t10_00 t10_30)
        (next-slot t10_30 t11_00)
        (next-slot t11_00 t11_30)
        (next-slot t11_30 t12_00)
        (next-slot t12_00 t12_30)
        (next-slot t12_30 t13_00)
        (next-slot t13_00 t13_30)
        (next-slot t13_30 t14_00)
        (next-slot t14_00 t14_30)
        (next-slot t14_30 t15_00)
        (next-slot t15_00 t15_30)
        (next-slot t15_30 t16_00)
        (next-slot t16_00 t16_30)

        ;; Billy's busy slots: 11:30 to 12:00, 13:00 to 15:00, 16:00 to 16:30
        (is-busy billy t11_30) ; 11:30-12:00
        (is-busy billy t13_00) ; 13:00-13:30
        (is-busy billy t13_30) ; 13:30-14:00
        (is-busy billy t14_00) ; 14:00-14:30
        (is-busy billy t14_30) ; 14:30-15:00
        (is-busy billy t16_00) ; 16:00-16:30

        ;; Maria's busy slots: 9:00 to 9:30, 10:00 to 10:30, 13:00 to 13:30, 14:00 to 14:30
        (is-busy maria t09_00) ; 9:00-9:30
        (is-busy maria t10_00) ; 10:00-10:30
        (is-busy maria t13_00) ; 13:00-13:30
        (is-busy maria t14_00) ; 14:00-14:30

        ;; William's busy slots: 9:30 to 10:00, 12:00 to 12:30, 13:30 to 15:00, 15:30 to 17:00
        (is-busy william t09_30) ; 9:30-10:00
        (is-busy william t12_00) ; 12:00-12:30
        (is-busy william t13_30) ; 13:30-14:00
        (is-busy william t14_00) ; 14:00-14:30
        (is-busy william t14_30) ; 14:30-15:00
        (is-busy william t15_30) ; 15:30-16:00
        (is-busy william t16_00) ; 16:00-16:30
        (is-busy william t16_30) ; 16:30-17:00
    )
    (:goal (exists (?t - time_point) (meeting-scheduled ?t)))
)