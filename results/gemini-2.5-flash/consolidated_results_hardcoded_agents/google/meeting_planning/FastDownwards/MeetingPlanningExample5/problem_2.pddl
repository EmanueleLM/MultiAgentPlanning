(define (problem MeetingPlanningExample5)
    (:domain meeting-scheduler)
    (:objects
        nh tc - location
    )
    (:init
        ; Start location: Nob Hill
        (at nh)

        ; Time initialization (9:00 AM)
        (= (total-time) 0)
        (= (meeting-duration) 0)
        (= (optimization-metric) 0)
        
        ; Initial status: Predicates not listed are implicitly false.
    )
    (:goal (and
        (has-met) ; Ensure minimum 75 minutes were met
        (not (meeting-in-progress)) ; Ensure the meeting has concluded
    ))
    
    (:metric minimize (optimization-metric))
)