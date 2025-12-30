(define (problem meeting-john)
    (:domain meeting-schedule)
    (:objects
    )

    (:init
        (at RH)
        (= (total-time) 540) ; Start at 9:00 AM (540 minutes)
        (= (meeting-duration) 0) ; Initialize optimization fluent
    )

    (:goal
        (min-meeting-duration-met) ; Goal: complete a meeting >= 90 min
    )
    
    (:metric maximize (meeting-duration)) ; Maximize actual meeting duration
)