(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        time-slot
        participant
    )
    (:predicates
        (free ?t - time-slot ?p - participant)
        (meeting_scheduled ?t - time-slot)
        (overall_goal_met)
    )

    (:action schedule_meeting
        :parameters (?t - time-slot)
        :precondition (and
            (free ?t ALEXANDER)
            (free ?t ELIZABETH)
            (free ?t WALTER)
        )
        :effect (and
            (meeting_scheduled ?t)
            (overall_goal_met)
        )
    )
)