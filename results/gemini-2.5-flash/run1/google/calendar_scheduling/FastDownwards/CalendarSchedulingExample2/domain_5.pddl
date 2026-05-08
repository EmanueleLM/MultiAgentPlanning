(define (domain calendar_scheduling_domain)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types timeslot)
    (:predicates
        (available_roy ?t - timeslot)
        (available_kathryn ?t - timeslot)
        (available_amy ?t - timeslot)
        (preferred_amy ?t - timeslot)
        (meeting_scheduled ?t - timeslot)
        (has_scheduled_meeting)
        (status_seeking_preferred)           ; New predicate to track preference state
        (status_seeking_non_preferred)       ; New predicate to track preference state
    )
    (:functions
        (total-cost) - number
    )

    (:action schedule_meeting_preferred
        :parameters (?t - timeslot)
        :precondition (and
            (available_roy ?t)
            (available_kathryn ?t)
            (available_amy ?t)
            (preferred_amy ?t)
            (status_seeking_preferred)
            (not (has_scheduled_meeting))
        )
        :effect (and
            (meeting_scheduled ?t)
            (has_scheduled_meeting)
            (increase (total-cost) 1)
        )
    )

    (:action consider_non_preferred
        :parameters ()
        :precondition (and
            (status_seeking_preferred)
            (not (has_scheduled_meeting))
        )
        :effect (and
            (not (status_seeking_preferred))
            (status_seeking_non_preferred)
            (increase (total-cost) 100) ; Penalty for moving to non-preferred state
        )
    )

    (:action schedule_meeting_non_preferred
        :parameters (?t - timeslot)
        :precondition (and
            (available_roy ?t)
            (available_kathryn ?t)
            (available_amy ?t)
            (not (preferred_amy ?t))
            (status_seeking_non_preferred)
            (not (has_scheduled_meeting))
        )
        :effect (and
            (meeting_scheduled ?t)
            (has_scheduled_meeting)
            (increase (total-cost) 1)
        )
    )