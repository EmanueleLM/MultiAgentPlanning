(define (domain coordinated-meeting-planner)
    (:requirements :strips :typing :conditional-effects)

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
                (increase (current-time)
                    (when (and (equal ?from union_square) (equal ?to nob_hill)) 9)
                )
                (increase (current-time)
                    (when (and (equal ?from nob_hill) (equal ?to union_square)) 7)
                )
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