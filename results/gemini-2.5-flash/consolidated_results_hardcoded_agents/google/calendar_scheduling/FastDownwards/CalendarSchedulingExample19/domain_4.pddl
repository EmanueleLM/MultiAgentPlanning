(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        time-slot - object
        agent - object
    )
    (:constants
        stephen edward angela - agent
    )
    (:predicates
        (next ?t1 - time-slot ?t2 - time-slot)
        (is-available ?a - agent ?t - time-slot)
        (meeting-scheduled ?t - time-slot)
        (scheduled-found)
    )
    (:action schedule-meeting
        :parameters (?start - time-slot ?middle - time-slot)
        :precondition (and
            (next ?start ?middle)
            ; Check availability for the first 30 minutes
            (is-available stephen ?start)
            (is-available edward ?start)
            (is-available angela ?start)
            ; Check availability for the second 30 minutes
            (is-available stephen ?middle)
            (is-available edward ?middle)
            (is-available angela ?middle)
        )
        :effect (and
            (meeting-scheduled ?start)
            (scheduled-found)
        )
    )
)