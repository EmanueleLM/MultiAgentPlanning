(define (domain coordinated-meeting-planner)
    (:requirements :strips :typing :negative-preconditions :fluents)

    (:types location person)

    (:predicates
        (at ?p - person ?l - location)
        (met-mary ?p - person)
        (meeting-scheduled)
    )

    (:functions
        (time)  ;; Global time function to track current time
    )

    (:action travel
        :parameters (?p - person ?from - location ?to - location)
        :precondition
            (and
                (at ?p ?from)
                (not (at ?p ?to))
                (<= (time) 960)  ;; Traveler can start traveling before 16:00
            )
        :effect
            (and
                (not (at ?p ?from))
                (at ?p ?to)
                (increase (time) 
                    (if (and (at ?from union_square) (at ?to nob_hill)) 9
                        (if (and (at ?from nob_hill) (at ?to union_square)) 7
                            0)))
            )
    )

    (:action meet-mary
        :parameters (?p - person)
        :precondition
            (and
                (at ?p nob_hill)
                (>= (time) 720)  ;; Meeting starts no earlier than 12:00
                (<= (time) 840)  ;; Meeting must end by 16:00
                (at mary nob_hill)
            )
        :effect
            (and
                (met-mary ?p)
                (meeting-scheduled)
                (increase (time) 75)
            )
    )
)