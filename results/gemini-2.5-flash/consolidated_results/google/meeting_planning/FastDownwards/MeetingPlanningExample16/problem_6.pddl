(define (problem meetingplanningexample16)
    (:domain meeting-planning)
    (:objects
        chinatown russian_hill - location
    )
    
    (:init
        (at chinatown) ; Start at 9:00 AM (T=540 minutes from midnight)
        (= (meeting_time) 0)
    )
    
    (:goal
        ; Must ensure minimum duration is met
        (min_duration_met)
    )
    
    ; Maximize the total meeting duration
    (:metric maximize (meeting_time))
)