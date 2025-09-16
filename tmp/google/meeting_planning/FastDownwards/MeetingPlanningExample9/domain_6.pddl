(define (domain coordinated-meeting-planner)
    (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions)

    (:types location person)

    (:predicates
        (at ?p - person ?l - location)
        (met-mary ?p - person)
        (meeting-scheduled)
    )

    (:functions
        (current-time)  ;; Rename to ensure compliance with :action-costs for time tracking
    )

    (:action travel
        :parameters (?p - person ?from - location ?to - location)
        :precondition
            (and
                (at ?p ?from)
                (not (at ?p ?to))
                (<= (current-time) 960)  ;; Traveler can start traveling before 16:00
            )
        :effect
            (and
                (not (at ?p ?from))
                (at ?p ?to)
                (increase (current-time) 
                    (when (and (at ?from union_square) (at ?to nob_hill)) 9)
                    (when (and (at ?from nob_hill) (at ?to union_square)) 7)
                )
            )
    )

    (:action meet-mary
        :parameters (?p - person)
        :precondition
            (and
                (at ?p nob_hill)
                (>= (current-time) 720)  ;; Meeting starts no earlier than 12:00
                (<= (current-time) 840)  ;; Meeting must end by 16:00
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