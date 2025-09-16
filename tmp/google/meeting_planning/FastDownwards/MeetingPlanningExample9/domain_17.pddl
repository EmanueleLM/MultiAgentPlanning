(define (domain coordinated-meeting-planner)
    (:requirements :strips :typing :equality :conditional-effects :durative-actions)

    (:types location person)

    (:predicates
        (at ?p - person ?l - location)
        (met-mary ?p - person)
        (meeting-scheduled)
    )

    (:functions
        (current-time)
    )

    (:action travel
        :parameters (?p - person ?from - location ?to - location)
        :precondition
            (and
                (at ?p ?from)
                (not (at ?p ?to))
                (<= (current-time) 960)
            )
        :effect
            (and
                (not (at ?p ?from))
                (at ?p ?to)
                (when (and (= ?from union_square) (= ?to nob_hill)) 
                    (increase (current-time) 9))
                (when (and (= ?from nob_hill) (= ?to union_square)) 
                    (increase (current-time) 7))
            )
    )

    (:action meet-mary
        :parameters (?p - person)
        :precondition
            (and
                (at ?p nob_hill)
                (>= (current-time) 720)
                (<= (current-time) 840)
                (at mary nob_hill)
            )
        :effect
            (and
                (met-mary ?p)
                (meeting-scheduled)
                (increase (current-time) 75)
            )
    )
)