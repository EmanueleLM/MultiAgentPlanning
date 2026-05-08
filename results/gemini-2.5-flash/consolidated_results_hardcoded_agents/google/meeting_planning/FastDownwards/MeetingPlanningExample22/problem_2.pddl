(define (problem meeting-planning-instance)
    (:domain meeting-planning)
    (:objects
        scheduler - agent
        andrew - friend
        presidio unionsquare - location
        T540 T562 T675 T780 - time_point
    )

    (:init
        (current-time T540) ; Start at 9:00 AM (540 min)
        (is-at scheduler presidio)
    )

    (:goal
        (met andrew)
    )
)