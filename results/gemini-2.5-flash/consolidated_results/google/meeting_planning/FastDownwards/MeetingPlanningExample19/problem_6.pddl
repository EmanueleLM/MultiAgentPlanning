(define (problem meeting_john_schedule)
    (:domain meeting-schedule)
    (:objects
        ggp ph - location
    )
    (:init
        (at ggp)
        (= (current-time) 0) ; Represents 9:00 AM
        (= (total-cost) 0)
    )

    (:goal 
        (and 
            (met-john)
        )
    )

    (:metric minimize (total-cost))
)