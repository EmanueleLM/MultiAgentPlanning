(define (problem MeetingPlanning_P6)
    (:domain MeetingPlanning)
    (:objects
        FW NH - location
        Kenneth - person
    )
    
    (:init
        ; Initial time 9:00 AM (t=0)
        (= (current_time) 0)
        (= (meeting_time Kenneth) 0)
        (= (total-cost) 0)
        
        ; Traveler starts at FW
        (at FW)
    )
    
    (:goal (and
        ; Must meet Kenneth for at least 90 minutes
        (>= (meeting_time Kenneth) 90) 
    ))

    ; Preference: Minimize overall elapsed time for travel and waiting
    (:metric minimize (total-cost))
)