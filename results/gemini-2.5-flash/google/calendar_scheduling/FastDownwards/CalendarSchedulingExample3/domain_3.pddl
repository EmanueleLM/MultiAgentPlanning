(define (domain calendar_scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
    )
    (:predicates
        (busy ?p - person ?ts - time_slot)
        (next_slot ?ts1 - time_slot ?ts2 - time_slot)
        (meeting_scheduled ?ts1 - time_slot ?ts2 - time_slot)
    )
    (:action schedule_meeting
        :parameters (?start_slot - time_slot ?middle_slot - time_slot)
        :precondition (and
            (next_slot ?start_slot ?middle_slot)
            (not (busy arthur ?start_slot))
            (not (busy arthur ?middle_slot))
            (not (busy michael ?start_slot))
            (not (busy michael ?middle_slot))
            (not (busy samantha ?start_slot))
            (not (busy samantha ?middle_slot))
        )
        :effect (and
            (meeting_scheduled ?start_slot ?middle_slot)
        )
    )