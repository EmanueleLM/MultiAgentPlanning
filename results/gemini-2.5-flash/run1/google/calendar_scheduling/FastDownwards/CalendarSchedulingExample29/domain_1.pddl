(define (domain calendar_scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
    )
    (:predicates
        (is_busy ?p - person ?s - time_slot)
        (next_slot ?s1 ?s2 - time_slot)
        (meeting_scheduled_at ?s - time_slot)
    )
    (:action schedule_meeting
        :parameters (?s1 ?s2 - time_slot)
        :precondition (and
            (next_slot ?s1 ?s2)
            (not (is_busy madison ?s1))
            (not (is_busy madison ?s2))
            (not (is_busy diana ?s1))
            (not (is_busy diana ?s2))
            (not (is_busy shirley ?s1))
            (not (is_busy shirley ?s2))
        )
        :effect (meeting_scheduled_at ?s1)
    )
)