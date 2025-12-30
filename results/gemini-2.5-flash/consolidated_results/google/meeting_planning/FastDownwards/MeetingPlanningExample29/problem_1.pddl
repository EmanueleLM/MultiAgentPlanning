(define (problem MeetingPlanningExample29)
    (:domain MeetingPlanningExample29)
    (:objects
        sd ha - location
    )
    (:init
        (at sd) ; Traveler starts at Sunset District
        (= (current-time) 540) ; 9:00 AM
        (= (meeting-duration-achieved) 0)
        (= (meeting-start-time) 0) 
    )
    (:goal (and
        (not (is-meeting))
        (>= (meeting-duration-achieved) 75) ; Minimum 75 minutes meeting time
    ))
    (:metric maximize (meeting-duration-achieved))
)