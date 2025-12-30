(define (problem MeetingPlanningExample29)
    (:domain MeetingPlanningExample29)
    (:objects
        sd ha - location
    )
    (:init
        (at sd) ; Traveler starts at Sunset District
        (t-540-start) ; 9:00 AM
    )
    (:goal (and
        (met-for-min-75) ; Ensure minimum duration is met
        (t-1305-end-meet-window) ; Ensure maximum possible duration is achieved (optimization)
    ))
)