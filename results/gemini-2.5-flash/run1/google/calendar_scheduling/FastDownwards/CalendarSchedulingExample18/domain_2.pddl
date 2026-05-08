(define (domain calendar_scheduling_example_18)
    (:requirements :strips :typing :action-costs :negative-preconditions)
    (:types person time_slot)
    (:predicates
        (person_available ?p - person ?s - time_slot)
        (meeting_scheduled ?s - time_slot)
        (billy_prefers_avoid ?s - time_slot)
        (no_meeting_scheduled) ; A predicate to ensure only one meeting is scheduled
    )
    (:functions (total-cost))

    (:action schedule_meeting_at_slot
        :parameters (?s - time_slot)
        :precondition (and
            (no_meeting_scheduled) ; Ensure no meeting has been scheduled yet
            (person_available brian ?s)
            (person_available billy ?s)
            (person_available patricia ?s)
        )
        :effect (and
            (meeting_scheduled ?s)
            (not (no_meeting_scheduled)) ; Mark that a meeting has been scheduled
            (when (billy_prefers_avoid ?s) (increase (total-cost) 1)) ; Add cost if preference is violated
        )
    )