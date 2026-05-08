(define (problem meeting-john)
    (:domain meeting-schedule)
    (:objects
        RH - location ; Russian Hill
        GGP - location ; Golden Gate Park
    )

    (:init
        (= (current-time) 540) ; 9:00 AM start
        (= (meeting-duration) 0)
        (at RH)
        (= (john-start-time) 780) ; 1:00 PM
        (= (john-end-time) 1095) ; 6:15 PM

        ; Travel times
        (= (travel-time RH GGP) 21)
        (= (travel-time GGP RH) 19)
        
        (= (max-allowed-duration) 0) 
    )

    (:goal
        (>= (meeting-duration) 90)
    )

    (:metric maximize (meeting-duration))
)