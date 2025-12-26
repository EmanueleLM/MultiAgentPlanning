(define (domain unified-scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types time-slot agent)
    (:predicates
        (busy ?a - agent ?t - time-slot)
        (scheduled ?t - time-slot)
    )

    (:action schedule-meeting
        :parameters (?t - time-slot ?p1 ?p2 ?p3 - agent)
        :precondition (and
            (not (busy ?p1 ?t))
            (not (busy ?p2 ?t))
            (not (busy ?p3 ?t))
            (not (scheduled ?t))
        )
        :effect (scheduled ?t)
    )
)