(define (domain MeetingScheduler)
    (:requirements :strips :typing)
    (:types participant time-slot)

    (:predicates
        (available ?p - participant ?t - time-slot)
        (during-work-hours ?t - time-slot)
        (meeting_scheduled ?t - time-slot)
        (needs_meeting ?p - participant)
    )

    (:action schedule_meeting
        :parameters (?p - participant ?t - time-slot)
        :precondition (and
            (during-work-hours ?t)
            (available ?p ?t)
            (not (meeting_scheduled ?t))
            (needs_meeting ?p)
        )
        :effect (and (meeting_scheduled ?t))
    )
)