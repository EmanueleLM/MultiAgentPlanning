(define (problem meeting-john)
    (:domain meeting-schedule)
    (:objects
    )

    (:init
        (at RH)
        (= (total-cost) 540) ; Start at 9:00 AM (540 minutes from midnight).
    )

    (:goal
        (and 
            (optimal-meeting-duration-met) ; Requires maximum 315 min meeting
            (at RH) ; Complete the schedule by returning to RH
        )
    )
    
    (:metric minimize (total-cost))