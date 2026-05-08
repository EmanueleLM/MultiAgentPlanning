(define (domain calendar_scheduling_example32)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
    )
    (:predicates
        (is_busy ?p - person ?s - time_slot)
        (is_frank_preferred_slot ?s - time_slot)
        (meeting_scheduled ?s - time_slot)
    )

    (:action schedule_meeting
        :parameters (?start_slot - time_slot)
        :precondition (and
            (is_frank_preferred_slot ?start_slot)
            (not (is_busy emily ?start_slot))
            (not (is_busy melissa ?start_slot))
            (not (is_busy frank ?start_slot))
        )
        :effect (and
            (meeting_scheduled ?start_slot)
        )
    )
)