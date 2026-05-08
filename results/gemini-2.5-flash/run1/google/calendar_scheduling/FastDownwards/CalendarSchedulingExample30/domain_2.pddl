(define (domain calendar-scheduling-example30)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
    )
    (:constants
        jeffrey - person
        virginia - person
        melissa - person
    )

    (:predicates
        (current_time_slot ?t - time_slot)
        (next_time_slot ?t1 - time_slot ?t2 - time_slot)
        (is_free ?p - person ?t - time_slot)
        (meeting_scheduled ?t - time_slot)
        (melissa_ok_with_time ?t - time_slot)
    )

    (:action advance_time
        :parameters (?from_t - time_slot ?to_t - time_slot)
        :precondition (and
            (current_time_slot ?from_t)
            (next_time_slot ?from_t ?to_t)
        )
        :effect (and
            (not (current_time_slot ?from_t))
            (current_time_slot ?to_t)
        )
    )

    (:action schedule_meeting
        :parameters (?at_t - time_slot)
        :precondition (and
            (current_time_slot ?at_t)
            (is_free jeffrey ?at_t)
            (is_free virginia ?at_t)
            (is_free melissa ?at_t)
            (melissa_ok_with_time ?at_t)
        )
        :effect (and
            (meeting_scheduled ?at_t)
        )
    )