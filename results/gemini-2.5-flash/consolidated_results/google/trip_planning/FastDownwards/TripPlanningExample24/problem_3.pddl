(define (problem trip-planning-instance-24)
    (:domain trip-planning-24)
    (:objects
        florence amsterdam riga - city
    )
    
    (:init
        ; Locations
        (at florence) 
        
        ; Connectivity
        (connected florence amsterdam)
        (connected amsterdam florence)
        (connected amsterdam riga)
        (connected riga amsterdam)
        
        ; Time tracking
        (= (current-day) 1) 
        
        ; Stay tracking (Audited durations: F=4, A=4, R=3)
        (= (days-in-F-spent) 0)
        (= (days-in-A-remaining) 4)
        (= (days-in-R-remaining) 3)
    )
    
    (:goal
        (and
            ; Total trip duration must be 13 days (current-day reaches 14)
            (= (current-day) 14) 
            
            ; All required stays must be completed.
            (= (days-in-A-remaining) 0)
            (= (days-in-R-remaining) 0)
            
            ; Must end in the final city of the sequence (Riga)
            (at riga)
        )
    )
)