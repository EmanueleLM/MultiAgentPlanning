(define (problem meeting_john_schedule)
    (:domain meeting-schedule)
    
    ; ggp and ph are defined as constants in the domain, so they are removed here.
    
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