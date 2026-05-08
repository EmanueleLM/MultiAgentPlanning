(define (problem MeetingPlanningExample5)
    (:domain meeting-scheduler)
    
    (:init
        ; Start location and stage
        (at nh)
        (current-stage S0)

        ; Cost initialization
        (= (total-cost) 0)
    )
    ; Goal: Reach the final time stage S4 and ensure the meeting is completed, thus maximizing duration.
    (:goal (and
        (current-stage S4) 
        (not (meeting-in-progress)) 
    ))
    
    (:metric minimize (total-cost))