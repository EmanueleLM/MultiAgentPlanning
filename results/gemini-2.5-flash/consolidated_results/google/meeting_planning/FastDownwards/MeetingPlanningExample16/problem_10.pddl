(define (problem meetingplanningexample16)
    (:domain meeting-planning-temporal)
    (:objects
        chinatown russian_hill - location
    )
    
    (:init
        (at chinatown) 
        (= (current_time) 0) ; T=0 corresponds to 9:00 AM
        (= (meeting_duration) 0)
        (= (min_meeting_required) 105) 
    )
    
    (:goal
        (and
            ; 1. Must satisfy the minimum meeting duration (105 min)
            (>= (meeting_duration) (min_meeting_required))
            ; 2. Must return to the original location 
            (at chinatown) 
        )
    )
    
    (:metric maximize (meeting_duration))
)