(define (problem MeetingPlanningOptimal)
    (:domain MeetingPlanning_Time_Axioms)
    (:objects
        BAYVIEW GGP - location
    )
    (:init
        (at BAYVIEW) ; Traveler starts at Bayview (9:00 AM)
        (= (total-cost) 0) ; Time reference: T=0
    )
    (:goal (and
        (met-barbara)
    ))
    ;; Optimize by minimizing the total time elapsed to achieve the goal.
    (:metric minimize (total-cost))
)