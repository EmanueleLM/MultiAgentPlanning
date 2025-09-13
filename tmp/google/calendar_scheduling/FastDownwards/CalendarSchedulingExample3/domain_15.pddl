(define (domain MeetingScheduler)
    (:requirements :strips :typing)
    (:types participant time-slot)

    (:predicates
        (available ?p - participant ?t - time-slot)
        (during-work-hours ?t - time-slot)
        (meeting_scheduled ?t - time-slot)
        (needs_meeting ?p - participant)
    )

    (:action arthur_unavailable
        :parameters (?t - time-slot)
        :precondition (and
            (available arthur ?t)
            (needs_meeting arthur)
        )
        :effect (not (available arthur ?t))
    )

    (:action michael_unavailable
        :parameters (?t - time-slot)
        :precondition (and
            (available michael ?t)
            (needs_meeting michael)
        )
        :effect (not (available michael ?t))
    )

    (:action samantha_unavailable
        :parameters (?t - time-slot)
        :precondition (and
            (available samantha ?t)
            (needs_meeting samantha)
        )
        :effect (not (available samantha ?t))
    )

    (:action schedule_meeting
        :parameters (?t - time-slot)
        :precondition (and
            (during-work-hours ?t)
            (available arthur ?t)
            (available michael ?t)
            (available samantha ?t)
            (not (meeting_scheduled ?t))
        )
        :effect (meeting_scheduled ?t)
    )
)