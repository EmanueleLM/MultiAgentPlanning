(define (domain calendar_scheduling_example_18)
    (:requirements :strips :typing :action-costs :negative-preconditions)
    (:types time_slot person)
    (:predicates
        (brian_available ?s - time_slot)
        (billy_available ?s - time_slot)
        (patricia_available ?s - time_slot)
        (meeting_scheduled ?s - time_slot)
        (billy_prefers_avoid ?s - time_slot)
        (no_meeting_scheduled)
    )
    (:functions (total-cost))

    (:action schedule_meeting_preferred_slot
        :parameters (?s - time_slot)
        :precondition (and
            (no_meeting_scheduled)
            (brian_available ?s)
            (billy_available ?s)
            (patricia_available ?s)
            (not (billy_prefers_avoid ?s)) ; This slot is NOT preferred to be avoided by Billy
        )
        :effect (and
            (meeting_scheduled ?s)
            (not (no_meeting_scheduled))
            (increase (total-cost) 0) ; Zero cost for scheduling a preferred slot
        )
    )

    (:action schedule_meeting_avoided_slot
        :parameters (?s - time_slot)
        :precondition (and
            (no_meeting_scheduled)
            (brian_available ?s)
            (billy_available ?s)
            (patricia_available ?s)
            (billy_prefers_avoid ?s) ; This slot IS preferred to be avoided by Billy
        )
        :effect (and
            (meeting_scheduled ?s)
            (not (no_meeting_scheduled))
            (increase (total-cost) 1) ; Cost of 1 for violating Billy's preference
        )
    )
)