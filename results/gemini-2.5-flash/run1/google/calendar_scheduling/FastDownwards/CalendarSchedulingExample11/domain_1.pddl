(define (domain calendar_scheduling)
    (:requirements :strips :typing :fluents) ; :fluents is included for robustness although not strictly used here for numeric fluents, good practice for fast-downwards
    (:types
        person
        time_slot
    )
    (:predicates
        (available ?p - person ?t - time_slot)
        (meeting_scheduled ?t - time_slot)
    )
    (:action schedule_meeting
        :parameters (?t - time_slot)
        :precondition (and
            (available alexander ?t)
            (available elizabeth ?t)
            (available walter ?t)
        )
        :effect (meeting_scheduled ?t)
    )
)