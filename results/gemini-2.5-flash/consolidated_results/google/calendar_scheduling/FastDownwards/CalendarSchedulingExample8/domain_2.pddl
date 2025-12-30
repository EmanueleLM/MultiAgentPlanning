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

    (:action schedule-meeting-A-J-M
        :parameters (?t - time-slot)
        :precondition (and
            ; Check availability for Adam
            (not (busy Adam ?t))
            ; Check availability for Jerry
            (not (busy Jerry ?t))
            ; Check availability for Matthew
            (not (busy Matthew ?t))
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