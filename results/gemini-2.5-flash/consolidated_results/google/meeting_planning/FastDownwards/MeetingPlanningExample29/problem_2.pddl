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
        (at ha)
        (met-for-min-75) ; Minimum 75 minutes meeting time satisfied
        (t-1305-finished-meeting) ; Time progression confirmed
    ))
    ; Metric maximization removed as it requires unsupported numeric fluents. The plan achieves maximum duration via action design.
)