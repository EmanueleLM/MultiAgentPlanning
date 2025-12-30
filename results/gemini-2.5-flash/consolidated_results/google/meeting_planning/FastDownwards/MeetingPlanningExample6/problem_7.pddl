(define (problem MeetingPlanning_P6)
    (:domain MeetingPlanning)
    
    ; Objects FW, NH, and Kenneth are now defined as constants in the domain.
    (:objects
    )
    
    (:init
        ; Traveler starts at FW at 9:00 AM (T=0)
        (at FW)
        (time-is-T0)
        
        (= (total-cost) 0)
    )
    
    (:goal (and
        ; Must meet Kenneth for at least 90 minutes
        (has_met_kenneth) 
    ))

    ; Metric: Minimize overall elapsed time for travel and waiting.
    (:metric minimize (total-cost))
)