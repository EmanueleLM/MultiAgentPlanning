(define (domain calendar_scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
    )
    (:predicates
        (available ?p - person ?t - time_slot)
        (meeting_scheduled ?t - time_slot)
        (meeting_found)
        (earlier ?t1 - time_slot ?t2 - time_slot)
    )

    (:action schedule_meeting
        :parameters (?t - time_slot)
        :precondition (and
            (available brittany ?t)
            (available emily ?t)
            (available doris ?t)
            (not (meeting_found))
        )
        :effect (and
            (meeting_scheduled ?t)
            (meeting_found)
        )
    )
)