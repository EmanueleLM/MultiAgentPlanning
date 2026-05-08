(define (problem meeting-schedule-26)
    (:domain meeting-scheduling)
    (:objects
        T1 - traveler
        Sarah - friend
        Richmond Presidio - location
    )
    (:init
        ; Traveler starts at Richmond at T=0 (9:00 AM)
        (at T1 Richmond)
        
        ; Sarah is available at Presidio (temporal window enforced by action constraints and plan structure)
        (available Sarah Presidio) 
        
        ; Distances (in minutes)
        (= (distance Richmond Presidio) 7)
        (= (distance Presidio Richmond) 7)
        
        ; Initialize metric fluents
        (= (time-spent-meeting Sarah) 0)
        (= (total-cost) 0)
    )
    (:goal
        (and
            (met Sarah)
            ; Hard duration constraint: Minimum 105 minutes.
            (>= (time-spent-meeting Sarah) 105)
        )
    )
    (:metric maximize (total-cost)) 
)