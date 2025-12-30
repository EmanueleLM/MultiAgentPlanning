(define (problem meeting-planning-problem)
    (:domain meeting-planning-domain)
    (:objects
        alamo-square sunset-district - location
        matthew - person
    )
    (:init
        ; Initial time 9:00 AM = 540 minutes from midnight
        (= (current-time) 540)
        (at alamo-square)
        
        (not (T-at-794))
        (not (T-at-810))
        (not (T-at-825))
        (not (meeting-started))
        (not (met matthew))
    )
    (:goal (met matthew))
    
    (:metric minimize (current-time)) 
)