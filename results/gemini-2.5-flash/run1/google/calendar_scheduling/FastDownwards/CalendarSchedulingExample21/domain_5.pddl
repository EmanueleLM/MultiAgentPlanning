(define (domain calendar_scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        time_point
        participant
    )
    (:constants
        bobby scott kimberly - participant
    )
    (:predicates
        (next_time ?t1 - time_point ?t2 - time_point)
        (available ?p - participant ?t - time_point)
        (meeting_scheduled ?start_time - time_point)
        (meeting_not_yet_scheduled)
    )

    (:action schedule_meeting
        :parameters (?start_slot - time_point ?next_slot - time_point)
        :precondition
            (and
                (next_time ?start_slot ?next_slot)
                (available bobby ?start_slot)
                (available bobby ?next_slot)
                (available scott ?start_slot)
                (available scott ?next_slot)
                (available kimberly ?start_slot)
                (available kimberly ?next_slot)
                (meeting_not_yet_scheduled)
            )
        :effect
            (and
                (meeting_scheduled ?start_slot)
                (not (meeting_not_yet_scheduled))
            )
    )
)