(define (domain calendar_scheduling_example_18)
    (:requirements :strips :typing :action-costs :negative-preconditions :existential-preconditions)
    (:types person time_slot)
    (:predicates
        (person_available ?p - person ?s - time_slot)
        (meeting_scheduled ?s - time_slot)
        (billy_prefers_avoid ?s - time_slot) ; Indicates a slot Billy prefers to avoid
    )

    (:action schedule_meeting_at_slot
        :parameters (?s - time_slot)
        :precondition (and
            ; Ensure no meeting has been scheduled yet (i.e., this action can only be taken once)
            (not (exists (?any_s - time_slot) (meeting_scheduled ?any_s)))
            ; All participants must be available for this slot
            (person_available brian ?s)
            (person_available billy ?s)
            (person_available patricia ?s)
        )
        :effect (and
            (meeting_scheduled ?s)
        )
        :cost (when (billy_prefers_avoid ?s) 1) ; Add a cost of 1 if this slot violates Billy's preference
    )
)