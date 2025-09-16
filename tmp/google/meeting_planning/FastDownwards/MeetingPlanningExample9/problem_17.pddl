(define (problem coordinated-meeting-problem)
    (:domain coordinated-meeting-planner)

    (:objects
        union_square nob_hill - location
        traveler mary - person
    )

    (:init
        (at traveler union_square)
        (at mary nob_hill)
        (= (current-time) 540)
    )

    (:goal
        (met-mary traveler)
    )
)