(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        time-slot
        participant
    )
    (:constants
        alexander elizabeth walter - participant
    )
    (:predicates
        (free ?t - time-slot ?p - participant)
        (meeting_scheduled ?t - time-slot)
        (overall_goal_met)
    )

    (:action schedule_meeting
        :parameters (?t - time-slot)
        :precondition (and
            (free ?t alexander)
            (free ?t elizabeth)
            (free ?t walter)
        )
        :effect (and
            (meeting_scheduled ?t)
            (overall_goal_met)
        )
    )
)