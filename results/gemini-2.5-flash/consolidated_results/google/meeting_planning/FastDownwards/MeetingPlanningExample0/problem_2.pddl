(define (problem meeting-planning-0)
    (:domain meeting-planning)
    (:objects
        traveler stephanie - agent
        marina mission - location
        T0 T20 T90 T210 - time-phase ; Time phases corresponding to 0, 20, 90, 210 minutes
    )
    (:init
        (at traveler marina)
        (time-is T0)
        (= (total-cost) 0) 
    )

    (:goal (and
        (met-for-120 stephanie)
    ))

    (:metric minimize (total-cost))
)