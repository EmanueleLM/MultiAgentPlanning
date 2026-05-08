(define (problem MeetingPlanningExample5)
    (:domain meeting-scheduler)
    
    (:init
        ; Start location and stage
        (at nh)
        (current-stage S0)

        ; Time initialization (9:00 AM, T=0)
        (= (total-time) 0)
        (= (meeting-duration) 0)
        (= (metric-to-minimize) 0)
    )
    (:goal (and
        (>= (meeting-duration) 75) ; Ensure minimum 75 minutes were met
        (not (meeting-in-progress)) ; Ensure the meeting has concluded
    ))
    
    (:metric minimize (metric-to-minimize))
)