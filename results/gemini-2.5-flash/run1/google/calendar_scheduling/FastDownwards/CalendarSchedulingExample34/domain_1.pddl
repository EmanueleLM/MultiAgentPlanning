(define (domain calendar_scheduling_example34)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_point
    )
    (:predicates
        (available ?p - person ?tp - time_point)
        (next ?tp1 ?tp2 - time_point)
        (meeting_scheduled ?tp1 ?tp2 - time_point)
    )

    (:action schedule_meeting
        :parameters (?p1 ?p2 ?p3 - person ?t1 ?t2 - time_point)
        :precondition (and
            (next ?t1 ?t2)
            (available ?p1 ?t1)
            (available ?p1 ?t2)
            (available ?p2 ?t1)
            (available ?p2 ?t2)
            (available ?p3 ?t1)
            (available ?p3 ?t2)
        )
        :effect (and
            (meeting_scheduled ?t1 ?t2)
        )
    )
)