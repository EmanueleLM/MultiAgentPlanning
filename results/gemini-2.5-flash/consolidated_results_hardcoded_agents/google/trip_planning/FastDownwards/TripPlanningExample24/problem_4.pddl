(define (problem trip-planning-instance-24)
    (:domain trip-planning-24)
    (:objects
        florence amsterdam riga - city
        D1 D2 D3 D4 D5 D6 D7 D8 D9 D10 D11 D12 D13 D14 - day
        C0 C1 C2 C3 C4 - stay-count
    )
    
    (:init
        ; Locations (Trip must start in Florence to meet D1-D4 constraint)
        (at florence) 
        
        ; Connectivity (F <-> A, A <-> R only)
        (connected florence amsterdam)
        (connected amsterdam florence)
        (connected amsterdam riga)
        (connected riga amsterdam)
        
        ; Time tracking (Start Day 1)
        (current-day D1) 
        
        ; Stay tracking (Start 0 days spent)
        (F-stay C0)
        (A-stay C0)
        (R-stay C0)
    )
    
    (:goal
        (and
            ; Total trip duration must be 13 days (current day must transition beyond D13 to D14)
            (current-day D14) 
            
            ; All required stays must be completed: F=4, A=4, R=3
            (F-stay C4)
            (A-stay C4)
            (R-stay C3)
            
            ; Must end in Riga
            (at riga)
        )
    )
)