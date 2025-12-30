(define (problem meeting-planning-0)
    (:domain meeting-planning)
    (:objects
        traveler stephanie - agent
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