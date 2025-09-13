(define (domain CombinedMeetingScheduler)
    (:requirements :strips :typing)
    (:types participant time-slot)

    (:predicates
        (available ?p - participant ?t - time-slot)
        (during-work-hours ?t - time-slot)
        (meeting_scheduled ?t - time-slot)
        (needs_meeting ?p - participant)
    )

    (:action schedule_meeting
        :parameters (?t - time-slot ?p1 - participant ?p2 - participant ?p3 - participant)
        :precondition (and
            (during-work-hours ?t)
            (available ?p1 ?t)
            (available ?p2 ?t)
            (available ?p3 ?t)
            (not (meeting_scheduled ?t))
            (needs_meeting ?p1)
            (needs_meeting ?p2)
            (needs_meeting ?p3)
        )
        :effect (meeting_scheduled ?t)
    )
)