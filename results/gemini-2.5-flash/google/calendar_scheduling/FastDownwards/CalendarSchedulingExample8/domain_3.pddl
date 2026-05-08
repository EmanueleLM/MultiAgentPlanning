(define (domain calendar_scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
    )
    (:predicates
        (busy ?p - person ?s - time_slot)
        (meeting_scheduled ?s - time_slot)
    )

    (:action schedule_meeting
        :parameters (?start_slot - time_slot)
        :precondition (and
            (not (busy adam ?start_slot))
            (not (busy jerry ?start_slot))
            (not (busy matthew ?start_slot))
        )
        :effect (meeting_scheduled ?start_slot)
    )
)