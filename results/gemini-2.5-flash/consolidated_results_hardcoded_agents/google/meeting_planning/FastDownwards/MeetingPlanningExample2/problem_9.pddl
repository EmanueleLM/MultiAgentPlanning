(define (problem MeetingPlanningExample2_P0)
(:domain MeetingPlanningExample2_STRIPS)
(:objects
    T - traveler
    HA SD - location 
    
    T0900 T1500 T1515 T1645 - timepoint 
)

(:init
    (is_ha HA)
    (is_sd SD)
    
    (at T HA)
    (current_time T0900)
    
    (duration_wait T0900 T1500) 
    (duration_travel T1500 T1515) 
    (duration_meeting T1515 T1645) 
)

(:goal (and
    (meeting_complete)
    (current_time T1645)
))
)