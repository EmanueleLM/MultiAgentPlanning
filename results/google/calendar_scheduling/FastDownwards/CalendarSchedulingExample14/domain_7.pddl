(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        time-slot 
        participant
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
            (is-available Brandon ?t)
            (is-available Jerry ?t)
            (is-available Bradley ?t)
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
            (is-available Brandon ?t)
            (is-available Jerry ?t)
            (is-available Bradley ?t)
            (not (brandon-prefers ?t))
        )
        :effect (and
            (meeting-scheduled ?t)
            (not (scheduling-active))
            (increase (total-cost) 1) 
        )
    )