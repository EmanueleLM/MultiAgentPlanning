(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        time-slot
    )

    (:predicates
        (is-available ?t - time-slot)
        (is-preferred ?t - time-slot)
        (meeting-scheduled ?t - time-slot)
        (meeting-scheduled-successfully)
    )

    (:functions
        (total-cost)
    )

    (:action schedule-preferred-meeting
        :parameters (?t - time-slot)
        :precondition (and
            (is-available ?t)
            (is-preferred ?t)
            (not (meeting-scheduled ?t))
            (not (meeting-scheduled-successfully))
        )
        :effect (and
            (meeting-scheduled ?t)
            (meeting-scheduled-successfully)
            (increase (total-cost) 0)
        )
    )

    (:action schedule-regular-meeting
        :parameters (?t - time-slot)
        :precondition (and
            (is-available ?t)
            (not (is-preferred ?t))
            (not (meeting-scheduled ?t))
            (not (meeting-scheduled-successfully))
        )
        :effect (and
            (meeting-scheduled ?t)
            (meeting-scheduled-successfully)
            (increase (total-cost) 1)
        )
    )