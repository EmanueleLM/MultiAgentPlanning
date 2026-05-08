(define (problem calendar-scheduling-18-problem)
    (:domain calendar-scheduling-18)
    (:objects
        T1 T2 T3 T4 T5 T6 T7 T8 T9 T10 T11 T12 T13 T14 T15 T16 - slot
    )
    (:init
        (= (total-cost) 0)

        ; Mutual Availability (T8: 12:30, T9: 13:00, T14: 15:30, T15: 16:00)
        (available T8) 
        (available T9) 
        (available T14) 
        (available T15) 

        ; Billy's Preference Violation (After 15:30 start: T14, T15, T16)
        (violates-preference T14)
        (violates-preference T15)
        (violates-preference T16)
    )
    (:goal (chosen-yet))
    (:metric minimize (total-cost))
)