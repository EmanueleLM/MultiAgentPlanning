(define (domain calendar_scheduling_example14)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        person
        time_slot
    )
    (:predicates
        (available ?p - person ?ts - time_slot)
        (is_preferred_slot ?ts - time_slot)
        (meeting_scheduled ?ts - time_slot)
    )
    (:functions (total-cost))

    (:action schedule_meeting_preferred
        :parameters (?ts - time_slot)
        :precondition (and
            (available brandon ?ts)
            (available jerry ?ts)
            (available bradley ?ts)
            (is_preferred_slot ?ts)
        )
        :effect (and
            (meeting_scheduled ?ts)
            (increase (total-cost) 1)
        )
    )

    (:action schedule_meeting_fallback
        :parameters (?ts - time_slot)
        :precondition (and
            (available brandon ?ts)
            (available jerry ?ts)
            (available bradley ?ts)
            (not (is_preferred_slot ?ts))
        )
        :effect (and
            (meeting_scheduled ?ts)
            (increase (total-cost) 2)
        )
    )
)