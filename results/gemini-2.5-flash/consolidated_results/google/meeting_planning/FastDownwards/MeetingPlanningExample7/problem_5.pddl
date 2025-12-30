(define (problem meeting-planning-example7)
    (:domain meeting-planning)
    (:objects
        richmond-district north-beach - location
    )
    
    (:init
        (= (total-cost) 0) ; Time starts at 9:00 AM (T=0)
        (at richmond-district) ; Start location
        (pre_375)             ; Initial time state: T < 375 (9:00 AM)
    )
    
    (:goal (and
        (met_john)
    ))
    
    (:metric minimize (total-cost))
)