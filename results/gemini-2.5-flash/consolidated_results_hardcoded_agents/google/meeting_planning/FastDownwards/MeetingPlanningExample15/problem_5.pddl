(define (problem meeting-john)
    (:domain meeting-schedule)
    (:objects
    )

    (:init
        (at RH)
        (= (total-cost) 540) ; Start at 9:00 AM (540 minutes)
        (= (negated-duration) 0) ; Initialize optimization fluent
    )

    (:goal
        (min-meeting-duration-met) ; Goal: complete a meeting >= 90 min
    )
    
    (:metric minimize (negated-duration)) ; Maximize actual meeting duration
)