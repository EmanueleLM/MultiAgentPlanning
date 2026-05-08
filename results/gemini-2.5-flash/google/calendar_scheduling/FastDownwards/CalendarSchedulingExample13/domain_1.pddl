(define (domain calendar_scheduling_example13)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        person
        time_slot
        preference_type
    )
    (:predicates
        (is_available ?p - person ?s - time_slot)
        (has_preference_type ?s - time_slot ?pt - preference_type)
        (meeting_scheduled ?s - time_slot)
        (meeting_scheduled_flag) ; Helper predicate to ensure only one meeting is scheduled
    )

    (:functions (total-cost))

    (:action schedule_meeting
        :parameters (?s - time_slot)
        :precondition (and
            (is_available gerald ?s)
            (is_available roy ?s)
            (is_available barbara ?s)
            (not (meeting_scheduled_flag))
        )
        :effect (and
            (meeting_scheduled ?s)
            (meeting_scheduled_flag)
            (when (has_preference_type ?s non_preferred_slot)
                (increase (total-cost) 1)
            )
        )
    )
)