(define (problem meeting-planning-example7)
    (:domain meeting-planning)
    (:objects
        richmond-district north-beach - location
    )
    
    (:init
        (= (total-time) 0) ; Time starts at 9:00 AM (T=0)
        (at richmond-district) ; Start location
        (time-pre-375)         ; Initial time state: T < 375
    )
    
    (:goal (and
        (met-john)
    ))
    
    (:metric minimize (total-time))
)