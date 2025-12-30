(define (problem meetingplanningexample16)
    (:domain meeting-planning)
    (:objects
        chinatown russian_hill - location
    )
    
    (:init
        (at chinatown) ; Start at 9:00 AM
        (= (meeting_time) 0)
    )
    
    (:goal
        (and
            (min_duration_met)          
            (max_meeting_time_achieved) 
            (travel_rh_c_complete)      
        )
    )
    
    (:metric maximize (meeting_time))
)