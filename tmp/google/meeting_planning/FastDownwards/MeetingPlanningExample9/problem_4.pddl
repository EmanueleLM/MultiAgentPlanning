(define (problem coordinated-meeting-problem)
    (:domain coordinated-meeting-planner)

    (:objects
        union_square nob_hill - location
        traveler mary - person
    )

    (:init
        (at traveler union_square)
        (at mary nob_hill)
        (= (time) 540) ;; Start at 09:00 in minutes
    )

    (:goal
        (met-mary traveler)
    )
)