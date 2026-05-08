(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        time-slot 
        participant
    )

    (:constants 
        brandon jerry bradley - participant
    )

    (:predicates
        (is-available ?p - participant ?t - time-slot)
        (meeting-scheduled ?t - time-slot)
        (brandon-prefers ?t - time-slot)
        (scheduling-active)
    )

    (:functions
        (total-cost)
    )

    (:action schedule-preferred-meeting
        :parameters (?t - time-slot)
        :precondition (and
            (scheduling-active)
            (is-available brandon ?t)
            (is-available jerry ?t)
            (is-available bradley ?t)
            (brandon-prefers ?t)
        )
        :effect (and
            (meeting-scheduled ?t)
            (not (scheduling-active))
        )
    )

    (:action schedule-unpreferred-meeting
        :parameters (?t - time-slot)
        :precondition (and
            (scheduling-active)
            (is-available brandon ?t)
            (is-available jerry ?t)
            (is-available bradley ?t)
            (not (brandon-prefers ?t))
        )
        :effect (and
            (meeting-scheduled ?t)
            (not (scheduling-active))
            (increase (total-cost) 1) 
        )
    )
)