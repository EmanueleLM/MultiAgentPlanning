(define (domain calendar-scheduling-example23)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types person time-slot)
    (:predicates
        (is-available ?p - person ?s - time-slot)
        (meeting-scheduled ?s - time-slot)
    )
    (:functions
        (total-cost)
        (slot-order ?s - time-slot)
    )

    (:action schedule-meeting
        :parameters (?s - time-slot)
        :precondition (and
            (is-available billy ?s)
            (is-available maria ?s)
            (is-available william ?s)
        )
        :effect (and
            (meeting-scheduled ?s)
            (increase (total-cost) (slot-order ?s))
        )
    )
)