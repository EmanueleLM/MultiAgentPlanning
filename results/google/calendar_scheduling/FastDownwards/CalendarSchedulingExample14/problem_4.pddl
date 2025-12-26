(define (problem scheduling-example-14)
    (:domain calendar-scheduling)
    (:objects
        brandon jerry bradley - participant
        T0 T1 T2 T3 T4 T5 T6 T7 T8 T9 T10 T11 T12 T13 T14 T15 - time-slot
    )

    (:init
        (= (total-cost) 0)
        (scheduling-active)

        ; Time mapping: T0=9:00, T11=14:30, T15=16:30

        ; --- Brandon Availability (Busy: 13:00-14:00 [T8, T9], 15:30-16:00 [T13], 16:30-17:00 [T15]) ---
        (is-available brandon T0) (is-available brandon T1) (is-available brandon T2) 
        (is-available brandon T3) (is-available brandon T4) (is-available brandon T5) 
        (is-available brandon T6) (is-available brandon T7) 
        (is-available brandon T10) (is-available brandon T11) (is-available brandon T12) 
        (is-available brandon T14) 

        ; --- Jerry Availability (Always available) ---
        (is-available jerry T0) (is-available jerry T1) (is-available jerry T2) 
        (is-available jerry T3) (is-available jerry T4) (is-available jerry T5) 
        (is-available jerry T6) (is-available jerry T7) (is-available jerry T8) 
        (is-available jerry T9) (is-available jerry T10) (is-available jerry T11) 
        (is-available jerry T12) (is-available jerry T13) (is-available jerry T14) 
        (is-available jerry T15) 

        ; --- Bradley Availability (Busy: 9:00-11:30 [T0-T4], 12:00-15:00 [T6-T10], 16:00-16:30 [T14]) ---
        (is-available bradley T5) ; 11:30-12:00
        (is-available bradley T11) ; 14:30-15:00
        (is-available bradley T12) ; 15:00-15:30
        (is-available bradley T13) ; 15:30-16:00
        (is-available bradley T15) ; 16:30-17:00

        ; --- Brandon Preference (Preferred slots T11 onwards, >= 14:30) ---
        (brandon-prefers T11) 
        (brandon-prefers T12) 
        (brandon-prefers T13) 
        (brandon-prefers T14) 
        (brandon-prefers T15)
    )

    (:goal (not (scheduling-active)))
    
    (:metric minimize (total-cost))
)