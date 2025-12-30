(define (problem MeetingPlanningP21)
    (:domain MeetingPlanning21)
    (:objects
        bayview ggp - location
    )
    (:init
        (at bayview) ; Start at Bayview
        (= (total-time) 0) ; Start time 9:00 AM
    )
    (:goal (and
        (met-barbara)
    ))
    (:metric minimize (total-time))
)