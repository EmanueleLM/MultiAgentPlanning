(define (problem meeting-scheduling-18)
    (:domain meeting-planning)
    (:objects
        me - person
        md rd - location
        betty - friend
    )
    (:init
        (at me md)
        (available betty rd)
        (t-0) ; Start time 9:00 AM
    )
    (:goal (met betty))