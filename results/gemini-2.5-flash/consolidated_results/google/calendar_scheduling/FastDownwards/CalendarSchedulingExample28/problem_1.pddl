(define (problem scheduling-28)
    (:domain calendar-scheduling-28)
    (:objects
        brittany emily doris - person
        T1 T2 T3 T4 T5 T6 T7 T8 T9 T10 T11 T12 T13 T14 T15 T16 - time
    )
    (:init
        (= (total-cost) 0)

        ;; --- Brittany Availability (Unavailable T9, T15) ---
        (available brittany T1) (available brittany T2) (available brittany T3)
        (available brittany T4) (available brittany T5) (available brittany T6)
        (available brittany T7) (available brittany T8)
        (available brittany T10) (available brittany T11) (available brittany T12)
        (available brittany T13) (available brittany T14)
        (available brittany T16)

        ;; --- Emily Availability (Available T1-T16) ---
        (available emily T1) (available emily T2) (available emily T3)
        (available emily T4) (available emily T5) (available emily T6)
        (available emily T7) (available emily T8) (available emily T9)
        (available emily T10) (available emily T11) (available emily T12)
        (available emily T13) (available emily T14) (available emily T15)
        (available emily T16)

        ;; --- Doris Availability (Available T5, T12) ---
        (available doris T5)
        (available doris T12)
    )
    (:goal
        (meeting-scheduled)
    )
    (:metric minimize (total-cost))
)