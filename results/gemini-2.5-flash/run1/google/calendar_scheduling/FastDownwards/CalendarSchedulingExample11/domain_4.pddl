(define (domain calendar_scheduling)
    (:requirements :strips :typing)
    (:types
        person
        time_slot
    )
    (:constants
        alexander elizabeth walter - person
    )
    (:predicates
        (available ?p - person ?t - time_slot)
        (meeting_scheduled ?t - time_slot)
        (meeting_found)
    )
    (:action schedule_meeting
        :parameters (?t - time_slot)
        :precondition (and
            (available alexander ?t)
            (available elizabeth ?t)
            (available walter ?t)
        )
        :effect (and
            (meeting_scheduled ?t)
            (meeting_found)
        )
    )
)