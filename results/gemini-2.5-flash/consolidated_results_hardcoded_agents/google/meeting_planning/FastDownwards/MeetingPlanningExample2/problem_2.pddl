(define (problem MeetingPlanningExample2_P0)
(:domain MeetingPlanningExample2_STRIPS)
(:objects
    T - traveler
    HA SD - location ; Haight-Ashbury, Sunset District
    T540 T900 T915 T1005 - timepoint 
    ; T540 = 9:00 AM
    ; T900 = 3:00 PM (Start travel)
    ; T915 = 3:15 PM (Jessica start time / Traveler arrival)
    ; T1005 = 4:45 PM (Meeting end, 90 min later)
)

(:init
    ; Connectivity: 15 min travel time both ways
    (is_connected HA SD)
    (is_connected SD HA)

    ; Initial state: Traveler arrives at HA at 9:00 AM (T540)
    (at T HA)
    (at_time T540)
)

(:goal (and
    (meeting_complete)
))
)