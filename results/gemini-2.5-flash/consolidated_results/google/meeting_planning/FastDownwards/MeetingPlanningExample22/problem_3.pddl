(define (problem meeting-planning-instance)
    (:domain meeting-planning)
    (:objects
        SCHEDULER - agent
        ANDREW - friend
        PRESIDIO UNIONSQUARE - location
        T540 T562 T675 T780 T804 - time_point
    )

    (:init
        (current-time T540) ; Start at 9:00 AM (540 min)
        (is-at SCHEDULER PRESIDIO)
    )

    (:goal
        (met ANDREW)
    )
)