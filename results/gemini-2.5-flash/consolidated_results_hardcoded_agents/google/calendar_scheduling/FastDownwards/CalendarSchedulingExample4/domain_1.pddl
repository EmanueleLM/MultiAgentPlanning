(define (domain calendar_scheduling)
    (:requirements :strips :typing)
    (:types
        time_slot - object
    )
    (:predicates
        (available_donna ?t - time_slot)
        (available_john ?t - time_slot)
        (available_billy ?t - time_slot)
        (meeting_scheduled ?t - time_slot)
    )

    (:action schedule_meeting
        :parameters (?t - time_slot)
        :precondition (and
            (available_donna ?t)
            (available_john ?t)
            (available_billy ?t)
        )
        :effect (and
            (meeting_scheduled ?t)
        )
    )
)