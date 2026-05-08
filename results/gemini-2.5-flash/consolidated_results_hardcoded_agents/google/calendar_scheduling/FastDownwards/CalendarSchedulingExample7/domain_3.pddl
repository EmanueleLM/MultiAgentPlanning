(define (domain calendar-scheduling-7)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        time - object
        participant - object
    )
    (:constants
        heather nicholas zachary - participant
    )
    (:predicates
        (is-available ?p - participant ?t - time) ; Availability derived from schedules/hard constraints
        (is-nonpreferred ?t - time) ; Denotes times violating Zachary's preference (start time >= 14:00)
        (meeting-scheduled ?t - time)
        (meeting-found) ; Predicate used to satisfy the generalized goal
    )
    (:functions
        (total-cost)
    )
    
    (:action schedule-preferred-meeting
        :parameters (?t - time)
        :precondition (and
            (not (meeting-found))
            (not (meeting-scheduled ?t))
            ; Check availability for all fixed participants
            (is-available heather ?t)
            (is-available nicholas ?t)
            (is-available zachary ?t)
            ; Check preference: Must be a preferred time (T < 14:00 start)
            (not (is-nonpreferred ?t))
        )
        :effect (and
            (meeting-scheduled ?t)
            (meeting-found)
            (increase (total-cost) 1) ; Low cost for preferred time
        )
    )

    (:action schedule-nonpreferred-meeting
        :parameters (?t - time)
        :precondition (and
            (not (meeting-found))
            (not (meeting-scheduled ?t))
            ; Check availability for all fixed participants
            (is-available heather ?t)
            (is-available nicholas ?t)
            (is-available zachary ?t)
            ; Check preference: Must be a non-preferred time (T >= 14:00 start)
            (is-nonpreferred ?t)
        )
        :effect (and
            (meeting-scheduled ?t)
            (meeting-found)
            (increase (total-cost) 10) ; High cost for non-preferred time
        )
    )
)