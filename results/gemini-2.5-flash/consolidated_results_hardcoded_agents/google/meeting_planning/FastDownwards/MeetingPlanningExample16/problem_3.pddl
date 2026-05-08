(define (problem meetingplanningexample16)
    (:domain meeting-sf)
    (:objects
        chinatown russian-hill - location
    )
    
    (:init
        (= (current-time) 540) ; 9:00 AM
        (= (total-meeting-time) 0)
        (at chinatown)
    )
    
    (:goal
        (and
            (met_ronald) ; Ensure a meeting occurred
        )
    )

    (:metric maximize (total-meeting-time))