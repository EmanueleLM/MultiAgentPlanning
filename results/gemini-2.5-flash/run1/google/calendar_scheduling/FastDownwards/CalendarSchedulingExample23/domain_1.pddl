(define (domain calendar_scheduling)
    (:requirements :strips :typing :existential-preconditions)
    (:types
        person
        one_hour_start_time
    )
    (:predicates
        (is_available ?p - person ?s - one_hour_start_time)
        (meeting_scheduled ?s - one_hour_start_time)
    )
    (:action schedule_meeting
        :parameters (?s - one_hour_start_time)
        :precondition (and
            (is_available billy ?s)
            (is_available maria ?s)
            (is_available william ?s)
        )
        :effect (meeting_scheduled ?s)
    )
)