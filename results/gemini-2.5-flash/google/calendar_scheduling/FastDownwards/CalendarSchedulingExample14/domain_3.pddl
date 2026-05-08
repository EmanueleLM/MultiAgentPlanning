(define (domain calendar_scheduling_example14)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        person
        time_slot
    )
    (:predicates
        (available ?p - person ?ts - time_slot)
        (is_preferred_slot ?ts - time_slot) ; Renamed for canonicalization and clarity
        (meeting_scheduled ?ts - time_slot)
    )
    (:functions (total-cost)) ; Required for :action-costs to track cumulative cost

    (:action schedule_meeting_preferred
        :parameters (?ts - time_slot)
        :precondition (and
            (available brandon ?ts)
            (available jerry ?ts)
            (available bradley ?ts)
            (is_preferred_slot ?ts) ; This slot satisfies Brandon's preference
        )
        :effect (and
            (meeting_scheduled ?ts)
            (increase (total-cost) 1) ; Lower cost for preferred slots
        )
    )

    (:action schedule_meeting_fallback
        :parameters (?ts - time_slot)
        :precondition (and
            (available brandon ?ts)
            (available jerry ?ts)
            (available bradley ?ts)
            (not (is_preferred_slot ?ts)) ; This slot does NOT satisfy Brandon's preference
        )
        :effect (and
            (meeting_scheduled ?ts)
            (increase (total-cost) 2) ; Higher cost for fallback slots
        )
    )
)