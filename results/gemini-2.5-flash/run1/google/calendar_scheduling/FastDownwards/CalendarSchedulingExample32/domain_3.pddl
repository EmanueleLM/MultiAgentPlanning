(define (domain calendar_scheduling_example32)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
    )
    (:predicates
        (is_busy ?p - person ?s - time_slot)
        (is_frank_preferred_slot ?s - time_slot)
        (meeting_scheduled ?s - time_slot)
    )

    (:action schedule_meeting
        :parameters (?s - time_slot ?e - person ?m - person ?f - person)
        :precondition (and
            (= ?e emily)
            (= ?m melissa)
            (= ?f frank)
            (is_frank_preferred_slot ?s)
            (not (is_busy ?e ?s))
            (not (is_busy ?m ?s))
            (not (is_busy ?f ?s))
        )
        :effect (and
            (meeting_scheduled ?s)
        )
    )
)