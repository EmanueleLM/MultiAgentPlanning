(define (domain calendar_scheduling_example32)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
    )
    (:predicates
        (busy ?p - person ?s - time_slot)
        (frank_prefers_start_slot ?s - time_slot)
        (meeting_scheduled ?s - time_slot)
    )

    (:action schedule_meeting
        :parameters (?s - time_slot)
        :precondition (and
            (frank_prefers_start_slot ?s)
            (not (busy emily ?s))
            (not (busy melissa ?s))
            (not (busy frank ?s))
        )
        :effect (and
            (meeting_scheduled ?s)
        )
    )
)