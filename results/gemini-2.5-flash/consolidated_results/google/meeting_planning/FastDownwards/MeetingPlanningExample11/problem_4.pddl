(define (problem meetingplanningexample11)
    (:domain meeting-schedule)
    (:objects
        nob_hill sunset_district - location
    )
    (:init
        (= (total-cost) 0)
        (= (meeting-duration) 0)
        (at nob_hill)
    )
    (:goal (and 
        (p_meeting_complete)
    ))
    (:metric maximize (meeting-duration))
)