(define (problem MeetingPlanningDA)
    (:domain MeetingPlanning21)
    (:objects
        bayview ggp - location
    )
    (:init
        (at bayview) ; Start at Bayview (T=0, 9:00 AM)
        (= (current-time) 0) 
    )
    (:goal (and
        (met-barbara)
    ))
    ;; Optimize by minimizing the completion time of the schedule.
    (:metric minimize (current-time))
)