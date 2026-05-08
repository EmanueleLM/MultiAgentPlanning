(define (problem meeting-schedule-25)
    (:domain meeting-planning-classical)
    (:objects
        GGP - location ; Golden Gate Park
        Chinatown - location
    )
    (:init
        ; Agent starts at GGP at 9:00 AM (T=540)
        (at GGP)
        (time-state-540) 

        ; Initial cost fluent for metric
        (= (total-cost) 0)
    )
    (:goal
        (and
            (met-minimum-duration)
        )
    )
    (:metric maximize (total-cost))
)