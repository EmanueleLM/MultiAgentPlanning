(define (domain calendar-scheduling)
    (:requirements :strips :typing :action-costs :negative-preconditions)
    (:types
        time-slot - object
        person - object
    )
    (:constants
        diana ethan janet - person
    )
    (:predicates
        (person-available ?p - person ?t - time-slot)
        (meeting-scheduled ?t - time-slot)
    )
    (:functions
        (total-cost)
    )

    (:action schedule-meeting
        :parameters (?t - time-slot)
        :precondition (and
            (person-available diana ?t)
            (person-available ethan ?t)
            (person-available janet ?t)
        )
        :effect (and
            (meeting-scheduled ?t)
            (increase (total-cost) 1)
        )
    )