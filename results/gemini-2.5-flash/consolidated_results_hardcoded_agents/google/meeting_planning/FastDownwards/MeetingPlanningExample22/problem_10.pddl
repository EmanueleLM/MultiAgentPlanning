(define (problem meeting-planning-instance)
    (:domain meeting-planning)
    (:objects
        scheduler - agent
        andrew - friend
        presidio unionsquare - location
        ; Time points (minutes from midnight):
        ; 9:00 AM = 540 (T540)
        ; 9:22 AM = 562 (T562) 
        ; 11:15 AM = 675 (T675) 
        ; 1:00 PM = 780 (T780) 
        ; 1:24 PM = 804 (T804)
        T540 T562 T675 T780 T804 - time_point
    )

    (:init
        ; Initial State: 9:00 AM at Presidio
        (current-time T540)
        (is-at scheduler presidio)
        
        ; Time Progression Links enforcing exact durations:
        (is-successor T540 T562) ; 22 min travel P->US
        (is-successor T562 T675) ; 113 min wait for Andrew availability (9:22 AM to 11:15 AM)
        (is-successor T675 T780) ; 105 min meeting duration (11:15 AM to 1:00 PM)
        (is-successor T780 T804) ; 24 min travel US->P
        
        ; Andrew is initially not available and not met
    )

    (:goal
        (met andrew)
    )
)