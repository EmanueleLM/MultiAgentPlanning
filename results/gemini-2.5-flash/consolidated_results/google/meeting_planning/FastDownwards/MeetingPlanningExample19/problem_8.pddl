(define (problem meeting_john_schedule)
    (:domain meeting-schedule)
    
    (:init
        (at ggp)
        (time-0) ; Represents 9:00 AM start
        (= (total-cost) 0)
    )

    (:goal 
        (and 
            (met-john)
        )
    )

    (:metric minimize (total-cost))
)