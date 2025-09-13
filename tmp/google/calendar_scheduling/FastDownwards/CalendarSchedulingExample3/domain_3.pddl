(define (domain CombinedMeetingScheduler)
    (:requirements :strips :typing)
    (:types participant time-slot hour)

    (:predicates
        (available ?p - participant ?t - time-slot)
        (during-work-hours ?t - time-slot)
        (blocked ?p - participant ?h - hour)
        (meeting_scheduled ?t - time-slot)
        (available_slot ?t - time-slot)
        (successor ?h1 - hour ?h2 - hour)
    )

    (:action schedule_meeting
        :parameters (?t - time-slot ?p1 - participant ?p2 - participant ?p3 - participant)
        :precondition (and
            (during-work-hours ?t)
            (available ?p1 ?t)
            (available_slot ?t)
            (not (blocked ?p3 ?t))
            (not (meeting_scheduled ?t))
        )
        :effect (meeting_scheduled ?t)
    )
)