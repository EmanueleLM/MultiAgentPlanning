(define (problem meeting-planning-example7)
    (:domain meeting-planning)
    (:objects
        RichmondDistrict NorthBeach - location
    )
    
    (:init
        (= (total-time) 0) ; Time starts at 9:00 AM
        (at RichmondDistrict) ; Start location
        (pre_375)             ; Initial time state: T < 375
    )
    
    (:goal (and
        (met_John)
    ))
    
    (:metric minimize (total-time))
)