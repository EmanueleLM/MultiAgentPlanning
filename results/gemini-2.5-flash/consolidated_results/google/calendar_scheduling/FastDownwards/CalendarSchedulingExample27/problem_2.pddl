(define (problem find-earliest-meeting)
    (:domain calendar-scheduling)
    (:objects
        T1 T2 T3 T4 T5 T6 T7 T8 T9 T10 T11 T12 T13 T14 T15 T16 - time-slot
    )

    (:init
        ;; Time progression (30-minute steps, 9:00 - 17:00)
        ;; T1=9:00, T16=16:30
        (succeeds T1 T2) (succeeds T2 T3) (succeeds T3 T4) (succeeds T4 T5)
        (succeeds T5 T6) (succeeds T6 T7) (succeeds T7 T8) (succeeds T8 T9)
        (succeeds T9 T10) (succeeds T10 T11) (succeeds T11 T12) (succeeds T12 T13)
        (succeeds T13 T14) (succeeds T14 T15) (succeeds T15 T16)

        ;; Availability (Intersection of Jesse, Kathryn, Megan schedules)
        ;; Available slots: 9:00, 9:30, 11:00, 12:30, 13:00, 14:30, 16:30
        (available T1) ; 09:00 - 09:30
        (available T2) ; 09:30 - 10:00
        ;; T3 (10:00) UNAVAILABLE (Jesse busy)
        ;; T4 (10:30) UNAVAILABLE (Megan busy)
        (available T5) ; 11:00 - 11:30
        ;; T6, T7 (11:30, 12:00) UNAVAILABLE (Megan busy)
        (available T8) ; 12:30 - 13:00
        (available T9) ; 13:00 - 13:30
        ;; T10, T11 (13:30, 14:00) UNAVAILABLE (Megan busy)
        (available T12) ; 14:30 - 15:00
        ;; T13, T14, T15 (15:00, 15:30, 16:00) UNAVAILABLE (Megan/Jesse busy)
        (available T16) ; 16:30 - 17:00
        
        ;; Start search at the beginning
        (current-slot T1)
    )

    (:goal (meeting-scheduled))
)