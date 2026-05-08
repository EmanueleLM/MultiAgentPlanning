(define (problem meeting-schedule-26)
    (:domain meeting-scheduling)
    (:objects
        T1 - traveler
        Sarah - friend
        Richmond Presidio - location
        ; T0=9:00 AM, T7=9:07 AM, T255=1:15 PM (Meeting Start), T360=3:00 PM (Meeting End)
        T0 T7 T255 T360 - time-stage
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