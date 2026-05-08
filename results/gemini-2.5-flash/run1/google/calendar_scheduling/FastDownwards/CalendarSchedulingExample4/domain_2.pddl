(define (domain calendar_scheduling_example4)
    (:requirements :strips :typing)
    (:types
        person
        time_slot
    )
    (:predicates
        (available ?p - person ?ts - time_slot)
        (meeting_scheduled ?ts - time_slot)
    )

    (:action schedule_meeting
        :parameters (?ts - time_slot)
        :precondition (and
            (available donna ?ts)
            (available john ?ts)
            (available billy ?ts)
        )
        :effect (and
            (meeting_scheduled ?ts)
        )
    )