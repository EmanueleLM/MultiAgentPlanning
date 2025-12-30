(define (problem meeting-schedule-1)
    (:domain meeting-scheduling)
    
    ; Objects are defined as constants in the domain, hence not redefined here.

    (:init
        ; Start location: Richmond District @ 9:00 AM
        (at richmond-district)
        
        ; Elapsed time starts at 0 (corresponding to 9:00 AM)
        (= (total-cost) 0)
    )

    (:goal
        (met betty)
    )

    ; Objective: Meet Betty, minimizing the total time elapsed.
    (:metric minimize (total-cost))
)