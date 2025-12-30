(define (problem meetingplanningexample11)
    (:domain meeting-schedule)
    (:objects
        nob-hill sunset-district - location
    )
    (:init
        (= (total-cost) 0)
        (= (meeting-duration) 0)
        (at nob-hill)
    )
    (:goal (and 
        (p_meeting_complete)
    ))
    (:metric maximize (meeting-duration))
)