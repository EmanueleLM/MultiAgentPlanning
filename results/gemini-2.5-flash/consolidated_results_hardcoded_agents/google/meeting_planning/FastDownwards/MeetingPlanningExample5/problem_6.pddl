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
    ; Goal: Ensure maximum meeting duration by reaching S4 (10:00 PM deadline) and concluding the meeting.
    ; Reaching S4 inherently proves the minimum 75 minutes constraint was met.
    (:goal (and
        (current-stage S4) 
        (not (meeting-in-progress)) 
    ))
    
    (:metric minimize (metric-to-minimize))
)