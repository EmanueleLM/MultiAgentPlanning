(define (domain calendar_scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
        meeting
    )
    (:predicates
        (is_available ?p - person ?t - time_slot)
        (next_slot ?t1 - time_slot ?t2 - time_slot)
        (meeting_scheduled ?m - meeting ?start_time - time_slot)
    )
    (:action schedule_meeting
        :parameters (?m - meeting ?start_time ?second_slot - time_slot)
        :precondition (and
            (next_slot ?start_time ?second_slot) ; 'second_slot' is the next 30-min segment for a 1-hour meeting
            (is_available bobby ?start_time)
            (is_available bobby ?second_slot)
            (is_available scott ?start_time)
            (is_available scott ?second_slot)
            (is_available kimberly ?start_time)
            (is_available kimberly ?second_slot)
        )
        :effect (and
            (meeting_scheduled ?m ?start_time)
            (not (is_available bobby ?start_time))
            (not (is_available bobby ?second_slot))
            (not (is_available scott ?start_time))
            (not (is_available scott ?second_slot))
            (not (is_available kimberly ?start_time))
            (not (is_available kimberly ?second_slot))
        )
    )
)