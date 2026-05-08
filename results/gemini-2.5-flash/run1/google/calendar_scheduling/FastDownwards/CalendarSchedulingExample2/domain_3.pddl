(define (domain calendar_scheduling_domain)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types timeslot)
    (:predicates
        (available_roy ?t - timeslot)
        (available_kathryn ?t - timeslot)
        (available_amy ?t - timeslot)
        (preferred_amy ?t - timeslot) ; Amy's preference: slot starts 15:30 or earlier
        (meeting_scheduled ?t - timeslot)
        (has_scheduled_meeting) ; To ensure only one meeting is scheduled
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
            (preferred_amy ?t) ; Precondition for a preferred slot
            (not (has_scheduled_meeting))
        )
        :effect (and
            (meeting_scheduled ?t)
            (has_scheduled_meeting)
            (increase (total-cost) 1) ; Lower cost for preferred slot
        )
    )

    (:action schedule_meeting_non_preferred
        :parameters (?t - timeslot)
        :precondition (and
            (available_roy ?t)
            (available_kathryn ?t)
            (available_amy ?t)
            (not (preferred_amy ?t)) ; Precondition for a non-preferred slot
            (not (has_scheduled_meeting))
        )
        :effect (and
            (meeting_scheduled ?t)
            (has_scheduled_meeting)
            (increase (total-cost) 100) ; Higher cost for non-preferred slot
        )
    )