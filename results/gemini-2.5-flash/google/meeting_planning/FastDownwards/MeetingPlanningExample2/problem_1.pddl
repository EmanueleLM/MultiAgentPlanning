(define (problem meeting-planning-example2)
    (:domain meeting-planning)
    
    (:objects
        ; No objects needed here as all specific instances are defined as constants in the domain
    )

    (:init
        (at traveler haight-ashbury)
        (= (current-time) 540) ; Traveler arrives at Haight-Ashbury at 9:00 AM (540 minutes from midnight)
        (= (total-cost) 0)     ; Initialize total cost
    )

    (:goal (and
        (meeting-completed)
        (at traveler sunset-district) ; Traveler should be at the meeting location after the meeting
        (>= (current-time) 1005)      ; Ensure the current time reflects the end of the meeting (4:45 PM)
    ))

    (:metric minimize (total-cost))
)