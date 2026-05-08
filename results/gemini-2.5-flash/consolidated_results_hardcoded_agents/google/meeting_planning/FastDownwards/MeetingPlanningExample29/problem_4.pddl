(define (problem MeetingPlanningExample29)
    (:domain MeetingPlanningExample29)
    (:objects
        sunset haight - location
    )
    (:init
        (at sunset) ; Traveler starts at Sunset District (9:00 AM / 540 min)
        (t-540-start) 
    )
    (:goal (and
        (met-for-min-75) ; Minimum 75 minutes met
        (t-1305-end-meet-window) ; Maximum possible duration achieved
    ))
)