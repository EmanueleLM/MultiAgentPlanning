(define (problem MeetingPlanningExample29)
    (:domain MeetingPlanningExample29)
    (:objects
        sunset haight - location
    )
    (:init
        (at sunset)
        (= (current-time) 540) 
        (= (total-meeting-time) 0)
    )
    (:goal (and 
        (>= (total-meeting-time) 75) ; Hard requirement: Meet for at least 75 minutes
    ))
    (:metric maximize (total-meeting-time))
)