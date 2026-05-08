(define (problem meeting-scheduling-18)
    (:domain meeting-planning)
    (:objects
        me - person
        md rd - location
        betty - friend
    )
    (:init
        (= (total-cost) 0) 
        (at me md)
        (available betty rd)
        (t-0) 
    )
    (:goal (met betty))
)