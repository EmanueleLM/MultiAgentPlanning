(define (domain calendar_scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_point
    )
    (:predicates
        (next_time ?t1 - time_point ?t2 - time_point)
        (available ?p - person ?t - time_point)
        (meeting_scheduled ?start_t - time_point)
    )

    (:action schedule_meeting
        :parameters (?p_stephen - person ?p_edward - person ?p_angela - person ?start_slot - time_point ?mid_slot - time_point)
        :precondition (and
            (next_time ?start_slot ?mid_slot)
            (available ?p_stephen ?start_slot)
            (available ?p_stephen ?mid_slot)
            (available ?p_edward ?start_slot)
            (available ?p_edward ?mid_slot)
            (available ?p_angela ?start_slot)
            (available ?p_angela ?mid_slot)
        )
        :effect (meeting_scheduled ?start_slot)
    )
)