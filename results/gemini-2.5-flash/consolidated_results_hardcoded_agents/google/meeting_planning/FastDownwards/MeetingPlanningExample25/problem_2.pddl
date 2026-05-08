(define (problem meeting-schedule-25)
    (:domain meeting-planning-classical)
    (:objects
        GGP - location ; Golden Gate Park
        Chinatown - location
    )
    (:init
        ; Agent starts at GGP
        (at GGP)
        ; Start time 09:00 AM = 540 minutes from midnight
        (= (current-time) 540) 

        ; Initial fluents
        (= (meeting-duration) 0)
        (= (total-cost) 0)
    )
    (:goal
        (and
            (met-minimum-duration)
        )
    )
    (:metric maximize (total-cost))
)