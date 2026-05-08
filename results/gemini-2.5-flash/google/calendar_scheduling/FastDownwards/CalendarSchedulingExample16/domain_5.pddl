(define (domain calendar_scheduling_example_16)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_point
    )
    (:constants
        scott gabriel christine - person
    )
    (:predicates
        (available ?p - person ?t - time_point)
        (meeting_scheduled_at ?t - time_point)
        (meeting_found)
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
            (meeting_found)
        )
    )
)