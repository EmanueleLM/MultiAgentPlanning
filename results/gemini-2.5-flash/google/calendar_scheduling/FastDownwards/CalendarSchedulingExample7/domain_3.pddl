(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs) ; Removed :conditional-effects
    (:types
        person
        time_slot ; Canonicalized to use underscore
    )
    (:predicates
        (available ?p - person ?t - time_slot)
        (meeting_scheduled ?t - time_slot) ; Canonicalized to use underscore
        (is_after_1400 ?t - time_slot) ; Canonicalized to use underscore
    )
    (:functions
        (total_cost) ; Canonicalized to use underscore
    )

    ;; Action for scheduling a meeting in a preferred time slot (not after 14:00 for Zachary)
    (:action schedule_meeting_preferred
        :parameters (?t - time_slot)
        :precondition (and
            (available heather ?t)
            (available nicholas ?t)
            (available zachary ?t)
            (not (meeting_scheduled ?t))
            (not (is_after_1400 ?t)) ; Precondition: This slot is NOT after 14:00 for Zachary's preference
        )
        :effect (and
            (meeting_scheduled ?t)
            (increase (total_cost) 1) ; Base cost for scheduling any meeting
        )
    )

    ;; Action for scheduling a meeting in an unpreferred time slot (at or after 14:00 for Zachary)
    (:action schedule_meeting_unpreferred
        :parameters (?t - time_slot)
        :precondition (and
            (available heather ?t)
            (available nicholas ?t)
            (available zachary ?t)
            (not (meeting_scheduled ?t))
            (is_after_1400 ?t) ; Precondition: This slot IS after 14:00 for Zachary's preference
        )
        :effect (and
            (meeting_scheduled ?t)
            (increase (total_cost) 11) ; Base cost (1) + preference penalty (10)
        )
    )
)