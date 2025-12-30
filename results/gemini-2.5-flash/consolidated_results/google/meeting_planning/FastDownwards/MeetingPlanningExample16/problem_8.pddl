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
            (min_duration_met) ; Must meet Ronald for at least 105 minutes
            (at_max_time)      ; Ensure meeting is maximized up to 9:30 PM deadline
            (meeting_ended)    ; Ensure the full sequence including exit travel is executed
        )
    )
    
    (:metric maximize (meeting_time))
)