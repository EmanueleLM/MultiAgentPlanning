(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        time-slot 
        participant
    )

    (:constants 
        brandon jerry bradley - participant
        T0 T1 T2 T3 T4 T5 T6 T7 T8 T9 T10 T11 T12 T13 T14 T15 - time-slot
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