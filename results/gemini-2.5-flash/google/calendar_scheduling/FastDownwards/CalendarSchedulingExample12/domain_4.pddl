(define (domain calendar_scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
    )
    (:predicates
        (available ?p - person ?ts - time_slot)
        (next_slot ?current_ts - time_slot ?next_ts - time_slot)
        (meeting_scheduled ?start_ts - time_slot)
    )

    (:action schedule_meeting
        :parameters (?start_ts - time_slot ?next_ts - time_slot)
        :precondition (and
            (next_slot ?start_ts ?next_ts)
            (available david ?start_ts)
            (available david ?next_ts)
            (available debra ?start_ts)
            (available debra ?next_ts)
            (available kevin ?start_ts)
            (available kevin ?next_ts)
            (not (meeting_scheduled ?start_ts)) ; Ensure only one meeting is scheduled
        )
        :effect (and
            (meeting_scheduled ?start_ts)
        )
    )