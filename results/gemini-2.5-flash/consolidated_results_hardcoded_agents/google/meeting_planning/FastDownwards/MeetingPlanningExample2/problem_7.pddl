(define (problem MeetingPlanningExample2_P0)
(:domain MeetingPlanningExample2_STRIPS)
(:objects
    T - traveler
    HA SD - location 
    
    T900 T1500 T1515 T1645 - timepoint 
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