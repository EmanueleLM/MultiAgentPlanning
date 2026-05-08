(define (problem meeting-schedule-1)
    (:domain meeting-scheduling)
    
    (:init
        ; Start location: Richmond District @ 9:00 AM (Time T=0)
        (at richmond-district)
        (= (total-cost) 0)
    )

    (:goal
        (met betty)
    )

    ; Objective: Meet Betty, minimizing the total time elapsed.
    (:metric minimize (total-cost))
)