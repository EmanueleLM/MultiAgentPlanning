(define (domain calendar_scheduling)
    (:requirements :strips :typing :negative-preconditions :existential-preconditions)
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
        :parameters (?m - meeting ?start_time ?middle_time - time_slot)
        :precondition (and
            (next_slot ?start_time ?middle_time) ; 'middle_time' is the second 30-min segment for a 1-hour meeting
            (is_available bobby ?start_time)
            (is_available bobby ?middle_time)
            (is_available scott ?start_time)
            (is_available scott ?middle_time)
            (is_available kimberly ?start_time)
            (is_available kimberly ?middle_time)
            ;; Ensure only one meeting is scheduled overall
            (not (exists (?s - time_slot) (meeting_scheduled ?m ?s)))
        )
        :effect (and
            (meeting_scheduled ?m ?start_time)
            (not (is_available bobby ?start_time))
            (not (is_available bobby ?middle_time))
            (not (is_available scott ?start_time))
            (not (is_available scott ?middle_time))
            (not (is_available kimberly ?start_time))
            (not (is_available kimberly ?middle_time))
        )
    )
)