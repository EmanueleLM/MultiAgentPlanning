(define (problem MEETING-SCHEDULE-26)
    (:domain MEETING-SCHEDULING)
    (:objects
        T1 - TRAVELER
        Sarah - FRIEND
    )
    (:init
        (at T1 Richmond)
        (time-is T0)
        (= (total-friends-met) 0)
    )
    (:goal
        (met-for-required-duration Sarah)
    )
    (:metric maximize (total-friends-met))
)