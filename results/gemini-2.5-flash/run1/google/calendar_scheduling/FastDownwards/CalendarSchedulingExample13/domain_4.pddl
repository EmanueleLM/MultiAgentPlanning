(define (domain calendar_scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        person
        time_point
    )
    (:constants
        gerald roy barbara - person
    )
    (:predicates
        (is_available ?p - person ?t - time_point)
        (next_time ?t1 - time_point ?t2 - time_point)
        (meeting_scheduled)
        (is_preferred_slot ?t - time_point)
        (has_preferred_option) ;; New predicate: True if any mutually available preferred slot exists
    )
    (:functions (total-cost))

    (:action schedule_preferred_meeting
        :parameters (?t - time_point)
        :precondition (and
            (is_available gerald ?t)
            (is_available roy ?t)
            (is_available barbara ?t)
            (is_preferred_slot ?t)
            (not (meeting_scheduled))
        )
        :effect (and
            (meeting_scheduled)
            (increase (total-cost) 1)
        )
    )

    (:action schedule_non_preferred_meeting
        :parameters (?t - time_point)
        :precondition (and
            (is_available gerald ?t)
            (is_available roy ?t)
            (is_available barbara ?t)
            (not (is_preferred_slot ?t))
            (not (has_preferred_option)) ;; Only allow non-preferred if no preferred options exist globally
            (not (meeting_scheduled))
        )
        :effect (and
            (meeting_scheduled)
            (increase (total-cost) 2)
        )
    )