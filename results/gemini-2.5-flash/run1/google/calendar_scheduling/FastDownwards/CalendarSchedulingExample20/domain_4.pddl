(define (domain calendar_scheduling_domain)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
    )
    (:constants
        ralph peter daniel - person
    )
    (:predicates
        (available ?p - person ?s - time_slot)
        (meeting_scheduled ?s - time_slot)
        (daniel_prefers_early_slot ?s - time_slot)
    )

    (:action schedule_meeting
        :parameters (?s - time_slot)
        :precondition (and
            (not (meeting_scheduled ?s))
            (available ralph ?s)
            (available peter ?s)
            (available daniel ?s)
            (daniel_prefers_early_slot ?s)
        )
        :effect (meeting_scheduled ?s)
    )
)