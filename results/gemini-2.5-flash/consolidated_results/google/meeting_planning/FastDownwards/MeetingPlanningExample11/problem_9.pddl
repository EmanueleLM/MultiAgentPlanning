(define (problem meetingplanningexample11)
    (:domain meeting-schedule)
    (:objects
        nob-hill sunset-district - location
    )
    (:init
        (= (total-cost) 0)
        (= (meeting-duration) 0)
        (at nob-hill) ; Arriving at 9:00 AM (T=0)
    )
    (:goal (and 
        (p_meeting_complete) ; Must meet Carol for minimum duration
    ))
    (:metric maximize (meeting-duration)) ; Optimize schedule by maximizing meeting time