(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        person
        timeslot
    )
    (:constants
        donna john billy - person
    )
    (:predicates
        (available ?p - person ?t - timeslot)
        (meeting-scheduled ?t - timeslot)
    )
    (:functions (total-cost))

    (:action schedule-meeting-at-time
        :parameters (?t - timeslot)
        :precondition (and
            (available donna ?t)
            (available john ?t)
            (available billy ?t)
            (not (meeting-scheduled ?t))
        )
        :effect (and
            (meeting-scheduled ?t)
            (increase (total-cost) 1)
        )
    )