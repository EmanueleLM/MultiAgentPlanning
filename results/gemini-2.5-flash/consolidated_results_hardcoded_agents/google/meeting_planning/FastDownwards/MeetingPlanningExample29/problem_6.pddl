(define (problem MeetingPlanningExample29)
    (:domain MeetingPlanningExample29)
    (:objects
        Sunset Haight - location
    )
    (:init
        (at Sunset) ; Traveler starts at Sunset District (9:00 AM / 540 min)
        (t-540-start) 
        (= (total-meeting-time) 0) ; Initialize metric fluent
    )
    (:goal (and 
        (met-for-min-75) 
        (t-1305-end-meet-window) ; Ensure sequence completion for maximization
    ))
    (:metric maximize (total-meeting-time))
)