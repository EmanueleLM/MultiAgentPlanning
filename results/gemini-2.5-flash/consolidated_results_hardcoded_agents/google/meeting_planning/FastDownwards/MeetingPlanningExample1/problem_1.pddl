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
        
        ; Start time: 9:00 AM (540 minutes from midnight)
        (= (current-time) 540)
    )

    (:goal
        (met betty)
    )

    ; The traveler's objective is to meet Betty efficiently. Minimize the completion time (makespan).
    (:metric minimize (current-time))
)