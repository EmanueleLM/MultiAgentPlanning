(define (problem meeting-john)
    (:domain meeting-schedule)
    (:objects
    )

    (:init
        (at RH)
        (= (total-cost) 540) ; 9:00 AM start time
    )

    (:goal
        (meeting-complete)
    )
    
    (:metric minimize (total-cost))
)