(define (domain calendar_scheduling_example0)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
    )
    (:predicates
        (blocked ?p - person ?t - time_slot)
        (next_slot ?t1 - time_slot ?t2 - time_slot)
        (meeting_scheduled ?t_start - time_slot)
    )

    (:action schedule_meeting
        :parameters (?p1 ?p2 ?p3 - person ?s1 ?s2 - time_slot)
        :precondition (and
            (next_slot ?s1 ?s2)
            (not (blocked ?p1 ?s1))
            (not (blocked ?p1 ?s2))
            (not (blocked ?p2 ?s1))
            (not (blocked ?p2 ?s2))
            (not (blocked ?p3 ?s1))
            (not (blocked ?p3 ?s2))
        )
        :effect (meeting_scheduled ?s1)
    )
)