(define (problem MeetingPlanningSTRIPS_P)
    (:domain MeetingPlanningSTRIPS)
    (:objects
        bayview ggp - location
    )
    (:init
        (at bayview) ; Start at Bayview at 9:00 AM
        (= (total-cost) 0) 
    )
    (:goal (and
        (met-barbara)
    ))
    (:metric minimize (total-cost))
)