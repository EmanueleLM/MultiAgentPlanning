(define (domain calendar_scheduling_example14)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
    )
    (:predicates
        (available ?p - person ?ts - time_slot)
        (slot_preferred ?ts - time_slot) ; Indicates a time slot that is preferred (e.g., after 14:30)
        (meeting_scheduled ?ts - time_slot)
    )

    (:action schedule_meeting
        :parameters (?ts - time_slot)
        :precondition (and
            (available brandon ?ts)
            (available jerry ?ts)
            (available bradley ?ts)
        )
        :effect (meeting_scheduled ?ts)
    )
)