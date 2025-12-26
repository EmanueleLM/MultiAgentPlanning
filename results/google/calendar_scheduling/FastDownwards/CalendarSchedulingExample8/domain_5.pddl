(define (domain unified-scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types time-slot agent)
    (:predicates
        (busy ?a - agent ?t - time-slot)
        (scheduled ?t - time-slot)
        (meeting-scheduled)
    )
    (:functions
        (total-cost)
    )

    (:action schedule-meeting-a-j-m
        :parameters (?t - time-slot)
        :precondition (and
            ; Check availability for Adam
            (not (busy adam ?t))
            ; Check availability for Jerry
            (not (busy jerry ?t))
            ; Check availability for Matthew
            (not (busy matthew ?t))
            ; Ensure only one meeting is scheduled
            (not (meeting-scheduled))
        )
        :effect (and
            (scheduled ?t)
            (meeting-scheduled)
            (increase (total-cost) 1)
        )
    )
)