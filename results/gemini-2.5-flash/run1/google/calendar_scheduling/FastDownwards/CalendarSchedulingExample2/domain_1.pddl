(define (domain calendar_scheduling_domain)
    (:requirements :strips :typing :negative-preconditions :existential-preconditions)
    (:types timeslot)
    (:predicates
        (available_roy ?t - timeslot)
        (available_kathryn ?t - timeslot)
        (available_amy ?t - timeslot)
        (preferred_amy ?t - timeslot) ; Amy's preference: slot starts 15:30 or earlier
        (meeting_scheduled ?t - timeslot)
        (has_scheduled_meeting) ; To ensure only one meeting is scheduled
    )

    (:action schedule_meeting
        :parameters (?t - timeslot)
        :precondition (and
            (available_roy ?t)
            (available_kathryn ?t)
            (available_amy ?t)
            (not (has_scheduled_meeting)) ; Only one meeting can be scheduled
        )
        :effect (and
            (meeting_scheduled ?t)
            (has_scheduled_meeting)
        )
    )
)