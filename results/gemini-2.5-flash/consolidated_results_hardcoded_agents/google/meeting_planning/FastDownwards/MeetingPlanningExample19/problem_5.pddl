(define (problem meeting_john_schedule)
    (:domain meeting-schedule)
    (:objects
        ggp ph - location
    )
    (:init
        (at ggp)
        (= (total-cost) 0)
        ; T=0 represents 9:00 AM.
        ; John's window: 7:45 PM (645 min relative) to 8:45 PM (705 min relative).
    )

    (:goal 
        (and 
            (met_john)
        )
    )

    (:constraints
        (and
            ; Meeting must start no earlier than 7:45 PM (645 minutes relative)
            (at start (meet_john) (>= #t 645)) 
            ; Meeting must end no later than 8:45 PM (705 minutes relative)
            (at end (meet_john) (<= #t 705))
        )
    )

    (:metric minimize (total-cost))
)