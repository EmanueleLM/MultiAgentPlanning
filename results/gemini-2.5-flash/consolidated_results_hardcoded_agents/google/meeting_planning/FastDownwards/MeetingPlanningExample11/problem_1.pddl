(define (problem meetingplanningexample11)
    (:domain meeting-schedule)
    (:objects
        nob_hill sunset_district - location
    )
    (:init
        (= (total-cost) 0)
        (at nob_hill)
        (not (ready_to_start_meeting))
        (not (met_carol))
    )
    (:goal (and 
        (met_carol)
    ))
    (:metric minimize (total-cost))
)