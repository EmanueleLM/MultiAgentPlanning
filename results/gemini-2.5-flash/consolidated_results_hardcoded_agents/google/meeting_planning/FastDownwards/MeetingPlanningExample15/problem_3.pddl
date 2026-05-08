(define (problem meeting-john)
    (:domain meeting-schedule)
    (:objects
        RH GGP - location 
    )

    (:init
        (at RH)
        (= (total-cost) 540) ; 9:00 AM start time
    )

    (:goal
        (meeting-complete)
    )
)