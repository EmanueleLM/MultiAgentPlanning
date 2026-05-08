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
            (not (has_scheduled_meeting))
        )
        :effect (and
            (meeting_scheduled ?t)
            (has_scheduled_meeting)
            (increase (total-cost) 1)
        )
    )

    (:action schedule_meeting_non_preferred
        :parameters (?t - timeslot)
        :precondition (and
            (available_roy ?t)
            (available_kathryn ?t)
            (available_amy ?t)
            (not (preferred_amy ?t))
            (not (has_scheduled_meeting))
        )
        :effect (and
            (meeting_scheduled ?t)
            (has_scheduled_meeting)
            (increase (total-cost) 100)
        )
    )
)