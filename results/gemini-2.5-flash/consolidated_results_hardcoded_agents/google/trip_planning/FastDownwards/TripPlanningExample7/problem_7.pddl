(define (problem TripPlanningProblem)
    (:domain TripPlanningDomain)
    
    (:init
        ; Initial Location 
        (at dubrovnik)
        (visited dubrovnik)
        
        ; Connectivity 
        (direct_flight dubrovnik istanbul)
        (direct_flight dubrovnik venice)
        (direct_flight istanbul dubrovnik)
        (direct_flight venice dubrovnik)

        ; Time Progression Setup 
        (current_time T0)
        (next_time T0 T1) (next_time T1 T2) (next_time T2 T3) (next_time T3 T4) 
        (next_time T4 T5) (next_time T5 T6) (next_time T6 T7) (next_time T7 T8) 
        (next_time T8 T9) (next_time T9 T10) (next_time T10 T11) 
        
        ; Stay Progression Setup 
        (next_stay S0 S1) (next_stay S1 S2) (next_stay S2 S3) (next_stay S3 S4) 
        (next_stay S4 S5) (next_stay S5 S6) 
        
        ; Initial Stay Counts 
        (days_venice S0)
        (days_dubrovnik S0)
        (days_istanbul S0)

        ; Initialize cost fluent
        (= (total-cost) 0)
    )
    
    (:goal (and
        ; 1. Visit all required cities
        (visited venice)
        (visited istanbul)
        
        ; 2. Strict total duration limit of 11 days 
        (current_time T11)
    ))
    
    ; Metric: Minimize the cost (maximize achievable stays up to limits V6, D4, I3)
    (:metric minimize (total-cost))
)