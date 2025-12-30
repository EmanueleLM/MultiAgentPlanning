(define (problem meeting-scheduling-temporal-18)
    (:domain meeting-planning-temporal)
    (:objects
        me - person
        betty - friend
        alpha - friend
    )
    (:init
        (at me md) ; Start at Marina District (MD) at T=0 (9:00 AM)
        (available betty rd) 
        (available alpha md) 
        
        (= (total-cost) 0)
        (= (total-meetings) 0)
        
        (at-md-pre-travel) ; Initial state for pre-travel activities
    )
    (:goal (and 
        (met betty) ; Required goal
    ))
    
    (:metric maximize (total-meetings))