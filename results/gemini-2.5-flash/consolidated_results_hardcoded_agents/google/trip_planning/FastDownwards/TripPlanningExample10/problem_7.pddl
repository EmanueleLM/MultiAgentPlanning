(define (problem trip-planning-10-p)
    (:domain trip-planning-10)
    
    (:init
        ;; Connections 
        (connection oslo dublin)
        (connection dublin oslo)
        (connection dublin valencia)
        (connection valencia dublin)
        
        ;; Initial state fluents
        (= (current-cost) 0)
        
        ;; Day status: Start at Day 0
        (D0)
    )
    (:goal (and
        (at valencia)
        (visited oslo)
        (visited dublin)
        (visited valencia)
        (D9) ; Total trip length is 9 days
    ))
    (:metric minimize (current-cost))
)