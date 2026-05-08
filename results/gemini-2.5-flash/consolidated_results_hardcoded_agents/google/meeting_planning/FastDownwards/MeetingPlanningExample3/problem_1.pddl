(define (problem MeetingPlanningP1)
    (:domain MeetingPlanning)
    (:objects
        bayview ggp - location
        ; Time points relative to 9:00 AM start:
        ; T_900 (0 min)
        ; T_922 (22 min, earliest arrival)
        ; T_1000 (60 min, latest start time)
        ; T_1052 (112 min, earliest finish time)
        ; T_1130 (150 min, latest finish time / Barbara cutoff)
        T_900 T_922 T_1000 T_1052 T_1130 - time-point
    )
    (:init
        (at bayview) ; Traveler starts at Bayview
        (current-time T_900) ; Start at 9:00 AM
        (available-at ggp) ; Barbara is available at Golden Gate Park
    )
    (:goal (met-barbara))
)