(define (domain calendar_scheduling_example_16)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_point
    )
    (:predicates
        (available ?p - person ?t - time_point)
        (meeting_scheduled_at ?t - time_point)
    )

    (:action schedule_meeting
        :parameters (?t - time_point ?participant1 - person ?participant2 - person ?participant3 - person)
        :precondition (and
            (available ?participant1 ?t)
            (available ?participant2 ?t)
            (available ?participant3 ?t)
        )
        :effect (and
            (meeting_scheduled_at ?t)
        )
    )
)