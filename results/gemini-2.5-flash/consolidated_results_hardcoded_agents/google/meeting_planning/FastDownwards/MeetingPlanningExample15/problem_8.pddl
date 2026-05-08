(define (problem meeting-john)
    (:domain meeting-schedule)
    (:objects
    )

    (:init
        (at RH)
        (= (total-cost) 540) ; Start at 9:00 AM (540 minutes from midnight). Tracks T.
    )

    (:goal
        (and 
            (optimal-meeting-duration-met) ; Ensures 315 min meeting (maximization)
            (at RH) ; Complete the schedule by returning to RH
        )
    )
    
    ; Minimize total-cost ensures the most efficient path is found to achieve the optimal meeting duration.
    (:metric minimize (total-cost))