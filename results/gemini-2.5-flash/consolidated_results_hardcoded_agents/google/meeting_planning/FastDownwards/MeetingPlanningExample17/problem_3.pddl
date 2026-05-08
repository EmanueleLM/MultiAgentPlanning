(define (problem meeting-planning-problem)
    (:domain meeting-planning-domain)
    (:objects
        alamo-square sunset-district - location
        matthew - person
    )
    (:init
        ; Start time is 9:00 AM. Total elapsed cost starts at 0.
        (at alamo-square)
        
        (not (T-R-254))
        (not (T-R-270))
        (not (T-R-285))
        (not (meeting-started))
        (not (met matthew))
    )
    (:goal (met matthew))
    
    (:metric minimize (total-cost)) 
)