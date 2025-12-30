(define (problem meeting-schedule-1)
    (:domain meeting-scheduling)
    
    (:init
        ; Start location: Richmond District @ 9:00 AM
        (at richmond-district)
        
        ; Time elapsed starts at 0 (corresponding to 9:00 AM)
        (= (elapsed-time) 0)
    )

    (:goal
        (met betty)
    )

    ; Objective: Meet Betty, minimizing the total time elapsed.
    (:metric minimize (elapsed-time))
)