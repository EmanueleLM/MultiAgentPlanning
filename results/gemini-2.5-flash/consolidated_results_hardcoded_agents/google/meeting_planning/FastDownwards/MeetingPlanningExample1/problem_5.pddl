(define (problem meeting-schedule-1)
    (:domain meeting-scheduling)
    
    (:init
        ; Start location: Richmond District @ 9:00 AM
        (at richmond-district)
        ; (total-cost) implicitly starts at 0, representing elapsed time in minutes.
    )

    (:goal
        (met betty)
    )

    ; Objective: Meet Betty, minimizing the total time elapsed.
    (:metric minimize (total-cost))
)