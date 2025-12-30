(define (problem meeting-planning-example7)
    (:domain meeting-planning)
    (:objects
        RichmondDistrict NorthBeach - location
    )
    
    (:init
        (= (current-time) 0) ; Time starts at 9:00 AM
        (at RichmondDistrict) ; Start location
    )
    
    (:goal (and
        (met_John)
    ))
    
    ; Minimize the total time taken to complete the tasks
    (:metric minimize (current-time))
)