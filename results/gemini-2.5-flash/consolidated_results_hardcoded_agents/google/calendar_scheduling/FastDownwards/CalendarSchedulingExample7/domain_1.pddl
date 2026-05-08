(define (domain calendar-scheduling-7)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        time - object
        participant - object
    )
    (:predicates
        (is-available ?p - participant ?t - time) ; Availability derived from schedules/hard constraints
        (is-nonpreferred ?t - time) ; Denotes times violating Zachary's preference (start time >= 14:00)
        (meeting-scheduled ?t - time)
    )
    (:functions
        (total-cost)
    )
    (:action schedule-meeting
        :parameters (?t - time)
        :precondition (and
            (not (meeting-scheduled ?t))
            (is-available heather ?t)
            (is-available nicholas ?t)
            (is-available zachary ?t)
        )
        :effect (and
            (meeting-scheduled ?t)
            ; Cost 1 for preferred times (T < 14:00 start)
            (when (not (is-nonpreferred ?t))
                (increase (total-cost) 1)
            )
            ; High cost (10) for non-preferred times (T >= 14:00 start)
            (when (is-nonpreferred ?t)
                (increase (total-cost) 10)
            )
        )
    )
)