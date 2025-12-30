(define (problem meeting-scheduling-temporal-18)
    (:domain meeting-planning-temporal)
    (:objects
        me - person
        betty - friend
        alpha - friend ; Hypothetical friend to allow metric maximization
    )
    (:init
        (at me md) ; Start at Marina District (MD) at T=0 (9:00 AM)
        (available betty rd) 
        (available alpha md) 
        (= (time-elapsed) 0)
        (= (total-meetings) 0)
    )
    (:goal (and 
        (met betty) ; Must meet Betty
        ; The optimal plan will seek to also meet alpha
    ))
    
    (:metric maximize (total-meetings))
)