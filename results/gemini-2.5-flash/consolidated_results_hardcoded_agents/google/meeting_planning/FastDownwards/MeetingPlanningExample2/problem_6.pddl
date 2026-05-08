(define (problem MeetingPlanningExample2_P0)
(:domain MeetingPlanningExample2_STRIPS)
(:objects
    T - traveler
    HA SD - location ; Haight-Ashbury, Sunset District
    
    T900 - timepoint ; 9:00 AM (Arrival/Wait Start)
    T1500 - timepoint ; 3:00 PM (Departure/Travel Start)
    T1515 - timepoint ; 3:15 PM (Arrival at SD/Meeting Start - Jessica available)
    T1645 - timepoint ; 4:45 PM (Meeting End - 90 min minimum completed)
)

(:init
    ; Initial state: Traveler arrives at HA at 9:00 AM (T900)
    (at T HA)
    (current_time T900)
)

(:goal (and
    (meeting_complete)
))
)