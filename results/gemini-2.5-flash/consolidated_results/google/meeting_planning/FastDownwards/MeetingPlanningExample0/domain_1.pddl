(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :durative-actions :timed-initial-literals)
    (:types
        agent location - object
    )
    (:predicates
        (at ?a - agent ?l - location)
        (available ?a - agent ?l - location)
        (met ?s - agent)
    )

    (:durative-action travel-marina-mission
        :parameters (?a - agent)
        :duration (= ?duration 20)
        :condition (and
            (at start (at ?a marina))
        )
        :effect (and
            (at start (not (at ?a marina)))
            (at end (at ?a mission))
        )
    )

    (:durative-action travel-mission-marina
        :parameters (?a - agent)
        :duration (= ?duration 19)
        :condition (and
            (at start (at ?a mission))
        )
        :effect (and
            (at start (not (at ?a mission)))
            (at end (at ?a marina))
        )
    )

    ; Action to model the required minimum 120-minute meeting
    (:durative-action meet-stephanie
        :parameters (?p - agent ?s - agent ?l - location)
        :duration (and (>= ?duration 120))
        :condition (and
            (at start (at ?p ?l))
            (at start (available ?s ?l))
            (over all (at ?p ?l)) ; Traveler stays put
            (over all (available ?s ?l)) ; Friend must be available throughout the duration
        )
        :effect (and
            (at end (met ?s))
        )
    )
)