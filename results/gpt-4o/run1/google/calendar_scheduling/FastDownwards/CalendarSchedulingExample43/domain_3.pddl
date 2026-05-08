(define (domain schedule_meeting)
    (:requirements :strips :typing :negative-preconditions)
    (:types participant time)
    (:predicates 
        (available ?p - participant ?t - time)
        (next ?t1 - time ?t2 - time)
        (meeting_scheduled)
    )

    (:action schedule_meeting
        :parameters (?t1 - time ?t2 - time)
        :precondition (and 
            (next ?t1 ?t2)
            (available albert ?t1)
            (available albert ?t2)
            (available gregory ?t1)
            (available gregory ?t2)
            (available benjamin ?t1)
            (available benjamin ?t2)
        )
        :effect (and
            (meeting_scheduled)
        )
    )
)