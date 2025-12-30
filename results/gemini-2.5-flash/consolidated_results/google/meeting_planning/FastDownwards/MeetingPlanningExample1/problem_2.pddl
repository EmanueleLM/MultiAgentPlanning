(define (problem meeting-schedule-1)
    (:domain meeting-scheduling)
    
    (:objects
        richmond-district - location
        financial-district - location
        betty - friend
    )

    (:init
        ; Start location: Richmond District
        (at richmond-district)
        
        ; Elapsed time starts at 0 (corresponding to 9:00 AM)
        (= (total-cost) 0)
    )

    (:goal
        (met betty)
    )

    ; Objective: Meet Betty, minimizing the total time elapsed (makespan).
    (:metric minimize (total-cost))
)