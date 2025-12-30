(define (problem meeting-scheduling-18)
    (:domain meeting-planning)
    (:objects
        me - person
        md rd - location
        betty - friend
        t0 ready-to-depart arrival-rd mission-complete - time-stage
    )
    (:init
        (at me md) ; Start at Marina District (MD)
        (available betty rd) ; Betty available at Richmond District (RD)
        (current-stage t0) ; 9:00 AM start time
        (= (total-cost) 0)
        (= (total-meetings) 0)
    )
    (:goal (and 
        (met betty)
        (current-stage mission-complete)
    ))
    
    (:metric maximize (total-meetings))
)