(define (problem meeting-planning-0)
    (:domain meeting-planning)
    (:objects
        traveler stephanie - agent
        marina mission - location
        T0 T20 T90 T210 T229 - time-phase ; T0=9:00, T20=9:20, T90=10:30, T210=12:30, T229=12:49
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