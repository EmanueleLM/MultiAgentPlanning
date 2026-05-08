(define (domain calendar_scheduling_example_16)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_point
    )
    (:predicates
        (available ?p - person ?t - time_point)
        (meeting_scheduled_at ?t - time_point)
        (meeting_found) ; New predicate to indicate that a meeting has been successfully scheduled
    )

    (:action schedule_meeting
        :parameters (?t - time_point)
        :precondition (and
            (available scott ?t)
            (available gabriel ?t)
            (available christine ?t)
        )
        :effect (and
            (meeting_scheduled_at ?t)
            (meeting_found) ; Set this predicate to true upon scheduling a meeting
        )
    )
)