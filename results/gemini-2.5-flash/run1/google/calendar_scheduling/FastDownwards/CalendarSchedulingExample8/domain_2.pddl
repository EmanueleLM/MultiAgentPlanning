(define (domain calendar_scheduling_example_8)
    (:requirements :strips :typing :negative-preconditions)
    (:types person time_slot)
    (:predicates
        (is_person ?p - person)
        (is_time_slot ?ts - time_slot)
        (busy ?p - person ?ts - time_slot)
        (meeting_scheduled ?ts - time_slot)
    )

    (:action schedule_meeting
        :parameters (?ts - time_slot)
        :precondition (and
            (is_time_slot ?ts)
            (not (busy adam ?ts))
            (not (busy jerry ?ts))
            (not (busy matthew ?ts))
        )
        :effect (meeting_scheduled ?ts)
    )
)