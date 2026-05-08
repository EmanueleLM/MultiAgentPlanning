(define (problem meeting-planning-instance)
    (:domain meeting-planning)
    (:objects
        scheduler - agent
        andrew - friend
        PRESIDIO UNIONSQUARE - location
        ; Time points (minutes from midnight):
        ; 9:00 AM = 540
        ; 9:22 AM = 562 (Arrival US)
        ; 11:15 AM = 675 (Andrew Available)
        ; 1:00 PM = 780 (Meeting End, 105 min later)
        ; 1:24 PM = 804 (Return P)
        T540 T562 T675 T780 T804 - time_point
    )

    (:init
        ; Initial State: 9:00 AM at Presidio
        (current-time T540)
        (is-at scheduler PRESIDIO)
        
        ; Time Progression Links enforcing durations:
        (is-successor T540 T562) ; 22 min travel P->US
        (is-successor T562 T675) ; 113 min wait for Andrew
        (is-successor T675 T780) ; 105 min meeting duration
        (is-successor T780 T804) ; 24 min travel US->P
    )

    (:goal
        (met andrew)
    )
)