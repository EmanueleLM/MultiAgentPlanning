(define (domain calendar-scheduling-integration)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        agent - object
        time-point - object
    )
    
    (:predicates
        (busy ?p - agent ?t - time-point) ; ?p is busy if a 60-min meeting starting at ?t conflicts
        (is-start-time ?t - time-point) ; Defines valid start times (9:00 to 16:00)
        (meeting-scheduled) ; Ensures only one successful schedule action is executed
    )

    (:functions
        (total-cost)
        (time-value ?t - time-point) ; Numerical value of the time point (minutes)
    )

    (define (action schedule-meeting)
        :parameters (?t - time-point)
        :precondition (and
            (is-start-time ?t)
            (not (busy theresa ?t))
            (not (busy charles ?t))
            (not (busy betty ?t))
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (increase (total-cost) (time-value ?t))
        )
    )
)