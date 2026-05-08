(define (problem MeetingPlanningExample2_P0)
(:domain MeetingPlanningExample2_STRIPS)
(:objects
    T - traveler
    HA SD - location ; Haight-Ashbury, Sunset District
    
    T_ARRIVE - timepoint ; 9:00 AM
    T_DEPART - timepoint ; 3:00 PM
    T_MEET_START - timepoint ; 3:15 PM
    T_MEET_END - timepoint ; 4:45 PM (90 minutes minimum requirement met)
)

(:init
    ; Connectivity: 15 min travel time
    (is_connected HA SD)
    (is_connected SD HA)

    ; Initial state: Traveler arrives at HA at 9:00 AM (T_ARRIVE)
    (at T HA)
    (current_time T_ARRIVE)
)

(:goal (and
    (meeting_complete)
))
)