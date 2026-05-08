(define (problem meeting-planning-example2)
    (:domain meeting-planning)
    
    (:objects
        ; No additional objects needed as all specific instances are defined as constants in the domain
    )

    (:init
        (at traveler haight-ashbury)
        (current-time-is tp-9am) ; Traveler arrives at Haight-Ashbury at 9:00 AM (initial condition)
        (= (total-cost) 0) ; Initialize total-cost to 0
    )

    (:goal (and
        (meeting-completed)          ; The meeting with Jessica must be completed
        (at traveler sunset-district) ; Traveler should be at the meeting location after the meeting
        (current-time-is tp-4_45pm)  ; The current time must reflect the end of the meeting (4:45 PM)
    ))

    (:metric minimize (total-cost)) ; Minimize the sum of action costs (representing total time spent/elapsed)
)