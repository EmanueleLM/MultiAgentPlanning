(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs :conditional-effects)
    (:types
        person
        time-slot
    )
    (:predicates
        (available ?p - person ?t - time-slot)
        (meeting-scheduled ?t - time-slot)
        (is-after-1400 ?t - time-slot) ; Marks slots that incur a preference cost for Zachary
    )
    (:functions
        (total-cost)
    )
    (:action schedule-meeting
        :parameters (?t - time-slot)
        :precondition (and
            (available heather ?t)
            (available nicholas ?t)
            (available zachary ?t)
            (not (meeting-scheduled ?t)) ; Ensure only one meeting is scheduled
        )
        :effect (and
            (meeting-scheduled ?t)
            (increase (total-cost) 1) ; Base cost for scheduling any meeting
            (when (is-after-1400 ?t) ; Apply Zachary's preference cost if the slot is after 14:00
                (increase (total-cost) 10)
            )
        )
    )
)