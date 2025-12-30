(define (problem MeetingPlanningExample2_P0)
(:domain MeetingPlanningExample2_STRIPS)
(:objects
    T - traveler
    HA SD - location 
    
    ; Timepoints based on the optimal schedule
    T0900 T1500 T1515 T1645 - timepoint 
)

(:init
    ; Location definitions
    (is_ha HA)
    (is_sd SD)
    
    ; Initial state: Traveler arrives at HA at 9:00 AM (T0900)
    (at T HA)
    (current_time T0900)
    
    ; Temporal constraints linking timepoints to required durations/activities
    (duration_wait T0900 T1500) 
    (duration_travel T1500 T1515) 
    (duration_meeting T1515 T1645) 
)

(:goal (and
    (meeting_complete)
    (current_time T1645) ; Ensure successful temporal progression to the end of the meeting
))
)