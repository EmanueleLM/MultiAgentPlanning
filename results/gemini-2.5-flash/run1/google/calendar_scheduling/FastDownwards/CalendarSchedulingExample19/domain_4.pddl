(define (domain calendar_scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_point
    )
    (:predicates
        (next_time ?t1 - time_point ?t2 - time_point)
        (available ?p - person ?t - time_point)
        (meeting_is_scheduled) ; A simple flag to indicate a meeting has been scheduled
    )

    (:action schedule_meeting
        :parameters (?start_slot - time_point ?mid_slot - time_point)
        :precondition (and
            (next_time ?start_slot ?mid_slot)
            (available stephen ?start_slot)
            (available stephen ?mid_slot)
            (available edward ?start_slot)
            (available edward ?mid_slot)
            (available angela ?start_slot)
            (available angela ?mid_slot)
        )
        :effect (meeting_is_scheduled)
    )
)