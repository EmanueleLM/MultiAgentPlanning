(define (problem meeting-schedule-25)
    (:domain meeting-planning-temporal)
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

        ; Travel times (23 minutes symmetric)
        (= (travel-duration GGP Chinatown) 23)
        (= (travel-duration Chinatown GGP) 23)
    )
    (:goal
        (and
            (met-minimum-duration)
        )
    )
    (:metric maximize (total-cost))
)