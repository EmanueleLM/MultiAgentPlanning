(define (problem MeetingPlanningExample29)
    (:domain MeetingPlanningExample29)
    (:objects
        sunset haight - location
    )
    (:init
        (at sunset) ; Traveler starts at Sunset District (9:00 AM / 540 min)
        (t-540) 
        (= (total-meeting-time) 0) ; Initialize metric fluent
    )
    (:goal (and 
        (met-for-min-75) 
        (t-1305) ; Ensure sequence completion up to the end of Nancy's window
    ))
    (:metric maximize (total-meeting-time))
)