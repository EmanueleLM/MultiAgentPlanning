(define (problem scheduling-example-14)
    (:domain calendar-scheduling)
    (:objects
        Brandon Jerry Bradley - participant
        T0 T1 T2 T3 T4 T5 T6 T7 T8 T9 T10 T11 T12 T13 T14 T15 - time-slot
    )

    (:init
        (= (total-cost) 0)
        (scheduling-active)

        ; Time mapping: T0=9:00, T11=14:30, T15=16:30

        ; --- Brandon Availability (Busy: T8, T9, T13, T15) ---
        (is-available Brandon T0) (is-available Brandon T1) (is-available Brandon T2) 
        (is-available Brandon T3) (is-available Brandon T4) (is-available Brandon T5) 
        (is-available Brandon T6) (is-available Brandon T7) 
        (is-available Brandon T10) (is-available Brandon T11) (is-available Brandon T12) 
        (is-available Brandon T14) 

        ; --- Jerry Availability (Always available) ---
        (is-available Jerry T0) (is-available Jerry T1) (is-available Jerry T2) 
        (is-available Jerry T3) (is-available Jerry T4) (is-available Jerry T5) 
        (is-available Jerry T6) (is-available Jerry T7) (is-available Jerry T8) 
        (is-available Jerry T9) (is-available Jerry T10) (is-available Jerry T11) 
        (is-available Jerry T12) (is-available Jerry T13) (is-available Jerry T14) 
        (is-available Jerry T15) 

        ; --- Bradley Availability (Available: T5, T11, T12, T13, T15) ---
        (is-available Bradley T5)
        (is-available Bradley T11)
        (is-available Bradley T12)
        (is-available Bradley T13)
        (is-available Bradley T15)

        ; --- Brandon Preference (Preferred slots T11 onwards, >= 14:30) ---
        (brandon-prefers T11) 
        (brandon-prefers T12) 
        (brandon-prefers T13) 
        (brandon-prefers T14) 
        (brandon-prefers T15)
    )

    (:goal (not (scheduling-active)))
    
    (:metric minimize (total-cost))