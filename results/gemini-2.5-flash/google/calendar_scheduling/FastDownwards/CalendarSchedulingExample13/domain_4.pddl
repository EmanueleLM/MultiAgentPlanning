(define (domain calendar_scheduling_example13)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        time_slot
        preference_type
        person ; Declare 'person' as a type
    )
    (:constants
        gerald roy barbara - person
    )
    (:predicates
        (is_available ?p - person ?s - time_slot)
        (has_preference_type ?s - time_slot ?pt - preference_type)
        (meeting_scheduled ?s - time_slot)
        (meeting_scheduled_flag) ; Helper predicate to ensure only one meeting is scheduled
    )

    (:functions (total-cost))

    (:action schedule_preferred_meeting
        :parameters (?s - time_slot)
        :precondition (and
            (is_available gerald ?s)
            (is_available roy ?s)
            (is_available barbara ?s)
            (not (meeting_scheduled_flag))
            (has_preference_type ?s preferred_slot)
        )
        :effect (and
            (meeting_scheduled ?s)
            (meeting_scheduled_flag)
            ; No cost increase for preferred slots
        )
    )

    (:action schedule_non_preferred_meeting
        :parameters (?s - time_slot)
        :precondition (and
            (is_available gerald ?s)
            (is_available roy ?s)
            (is_available barbara ?s)
            (not (meeting_scheduled_flag))
            (has_preference_type ?s non_preferred_slot)
        )
        :effect (and
            (meeting_scheduled ?s)
            (meeting_scheduled_flag)
            (increase (total-cost) 1) ; Cost increase for non-preferred slots
        )
    )
)