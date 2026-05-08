(define (problem MEETING-SCHEDULE-26)
    (:domain MEETING-SCHEDULING)
    (:objects
        T1 - TRAVELER
        Sarah - FRIEND
        Richmond Presidio - LOCATION
        ; T0=9:00 AM (0), T7=9:07 AM (7), T255=1:15 PM (255), T360=3:00 PM (360)
        T0 T7 T255 T360 - TIME-STAGE
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