(define (problem meeting-planning-instance)
    (:domain meeting-planning)
    (:objects
        scheduler - agent
        andrew - friend
        presidio unionsquare - location
    )

    (:init
        (= (current-time) 540) ; Start at 9:00 AM
        (= (total-meetings) 0)
        (is-at scheduler presidio)
    )

    (:goal
        (and
            (met andrew)
        )
    )

    (:metric minimize (
        - (total-meetings)
    ))
)