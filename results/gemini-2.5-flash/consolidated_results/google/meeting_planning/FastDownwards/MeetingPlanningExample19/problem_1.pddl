(define (problem MeetingPlanningExample19)
    (:domain meeting-scheduling)
    (:objects
        ggp - location
        ph - location
    )
    (:init
        (at ggp)
        (= (total-cost) 0)
    )
    (:goal
        (and
            (met_john)
        )
    )
    (:metric minimize (total-cost))
)