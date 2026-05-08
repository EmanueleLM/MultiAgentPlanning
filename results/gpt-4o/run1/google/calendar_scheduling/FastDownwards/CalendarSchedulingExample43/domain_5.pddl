(define (domain schedule_meeting)
    (:requirements :strips :typing :negative-preconditions)
    (:types participant time)
    (:predicates
        (available ?p - participant ?t1 - time ?t2 - time)
        (next ?t1 - time ?t2 - time)
        (meeting_scheduled ?t1 - time ?t2 - time)
    )
    (:action schedule_meeting
        :parameters (?t1 - time ?t2 - time)
        :precondition (and
            (next ?t1 ?t2)
            (available albert ?t1 ?t2)
            (available gregory ?t1 ?t2)
            (available benjamin ?t1 ?t2)
        )
        :effect (meeting_scheduled ?t1 ?t2)
    )
)