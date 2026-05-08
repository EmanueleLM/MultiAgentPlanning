(define (problem meeting-planning-temporal-23)
    (:domain meeting-scheduler-temporal)

    (:objects
    )

    (:init
        (at bayview) ; Start location
        (= (current-time) 540) ; 9:00 AM
    )

    (:goal
        (john-met-duration-satisfied)
    )
)