(define (problem MeetingPlanningSTRIPS)
    (:domain MeetingPlanningSTRIPS)
    (:objects
        bayview ggp - location
    )
    (:init
        (at bayview) ; Start at Bayview (T=0, 9:00 AM)
        (= (total-time) 0) 
    )
    (:goal (and
        (met-barbara)
    ))
    ;; Optimize by minimizing the total time elapsed.
    (:metric minimize (total-time))
)