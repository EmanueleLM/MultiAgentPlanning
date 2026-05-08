(define (problem MeetingPlanningOptimal)
    (:domain MeetingPlanning2_1)
    (:objects
        bayview ggp - location
    )
    (:init
        (at bayview) ; Traveler starts at Bayview
        (= (current-time) 0) ; Time reference: 9:00 AM
    )
    (:goal (and
        (meeting-achieved)
    ))
    ;; Optimize by minimizing the total time elapsed to achieve the goal.
    (:metric minimize (current-time))
)