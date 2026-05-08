(define (domain calendar_scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
    )
    (:constants
        diana ethan janet - person
    )
    (:predicates
        (is_available ?p - person ?t - time_slot)
        (meeting_scheduled ?t - time_slot)
    )

    (:action schedule_meeting
        :parameters (?t - time_slot)
        :precondition (and
            (is_available diana ?t)
            (is_available ethan ?t)
            (is_available janet ?t)
        )
        :effect (meeting_scheduled ?t)
    )
)