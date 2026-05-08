(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        time-slot
        participant
    )
    (:predicates
        (free ?t - time-slot ?p - participant)
        (meeting_scheduled ?t - time-slot)
    )

    (:action schedule_meeting
        :parameters (?t - time-slot ?a - participant ?e - participant ?w - participant)
        :precondition (and
            (free ?t ?a)
            (free ?t ?e)
            (free ?t ?w)
        )
        :effect (meeting_scheduled ?t)
    )
)