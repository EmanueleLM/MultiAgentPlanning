(define (domain calendar_scheduling_example31)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
    )
    (:predicates
        (available ?p - person ?s - time_slot)
        (slot_ok_for_martha ?s - time_slot)
        (meeting_scheduled_at ?s - time_slot)
        (meeting_scheduled_overall)
    )

    (:action schedule_meeting
        :parameters (?s - time_slot)
        :precondition (and
            (available richard ?s)
            (available martha ?s)
            (available kimberly ?s)
            (slot_ok_for_martha ?s)
            (not (meeting_scheduled_overall))
        )
        :effect (and
            (meeting_scheduled_at ?s)
            (meeting_scheduled_overall)
        )
    )
)