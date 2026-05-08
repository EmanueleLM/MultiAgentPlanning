(define (problem MeetingPlanningExample29)
    (:domain MeetingPlanningExample29)
    (:objects
        sunset haight - location
    )
    (:init
        (at sunset) ; Traveler starts at Sunset District (9:00 AM / 540 min)
        (t-540-start) 
        (= (total-meeting-time) 0) ; Initialize metric fluent
    )
    (:goal (met-for-min-75)) ; Minimum 75 minutes must be met (Hard constraint)
    (:metric maximize (total-meeting-time))
)