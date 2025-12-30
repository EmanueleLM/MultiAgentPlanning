(define (problem scheduling-28)
    (:domain calendar-scheduling-28)
    (:objects
        BRITTANY EMILY DORIS - person
        T1 T2 T3 T4 T5 T6 T7 T8 T9 T10 T11 T12 T13 T14 T15 T16 - time
    )
    (:init
        (= (total-cost) 0)

        ;; --- BRITTANY Availability (Unavailable T9 (13:00), T15 (16:00)) ---
        (available BRITTANY T1) (available BRITTANY T2) (available BRITTANY T3)
        (available BRITTANY T4) (available BRITTANY T5) (available BRITTANY T6)
        (available BRITTANY T7) (available BRITTANY T8)
        (available BRITTANY T10) (available BRITTANY T11) (available BRITTANY T12)
        (available BRITTANY T13) (available BRITTANY T14)
        (available BRITTANY T16)

        ;; --- EMILY Availability (Available T1-T16) ---
        (available EMILY T1) (available EMILY T2) (available EMILY T3)
        (available EMILY T4) (available EMILY T5) (available EMILY T6)
        (available EMILY T7) (available EMILY T8) (available EMILY T9)
        (available EMILY T10) (available EMILY T11) (available EMILY T12)
        (available EMILY T13) (available EMILY T14) (available EMILY T15)
        (available EMILY T16)

        ;; --- DORIS Availability (Available T5 (11:00), T12 (14:30)) ---
        (available DORIS T5)
        (available DORIS T12)
    )
    (:goal
        (meeting-scheduled)
    )
    (:metric minimize (total-cost))
)