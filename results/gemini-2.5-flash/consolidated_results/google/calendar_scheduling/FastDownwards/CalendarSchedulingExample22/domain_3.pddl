(define (domain calendar-scheduling-integration)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        agent - object
        time-point - object
    )
    
    (:predicates
        (busy ?p - agent ?t - time-point)
        (is-start-time ?t - time-point)
        (meeting-scheduled)
    )

    (:functions
        (total-cost)
        (time-value ?t - time-point)
    )

    (:action schedule-meeting
        :parameters (?t - time-point)
        :precondition (and
            (is-start-time ?t)
            ; Ensure constants match object definitions in the problem file
            (not (busy THERESA ?t))
            (not (busy CHARLES ?t))
            (not (busy BETTY ?t))
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (increase (total-cost) (time-value ?t))
        )
    )
)