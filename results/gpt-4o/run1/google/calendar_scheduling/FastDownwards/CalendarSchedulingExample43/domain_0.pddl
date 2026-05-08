(define (domain schedule_meeting)
    (:requirements :strips :typing :negative-preconditions)
    (:types participant time)
    (:predicates 
        (available ?p - participant ?t - time)
        (next ?t1 - time ?t2 - time)
        (meeting_scheduled)
    )

    (:action Schedule_Meeting
        :parameters (?t - time)
        :precondition (and 
            (available albert ?t)
            (available gregory ?t)
            (available benjamin ?t)
            (next ?t ?tp)
            (next ?tp ?tpp)
        )
        :effect (and
            (meeting_scheduled)
            (not (available albert ?t))
            (not (available gregory ?t))
            (not (available benjamin ?t))
            (not (available albert ?tp))
            (not (available gregory ?tp))
            (not (available benjamin ?tp))
        )
    )
)