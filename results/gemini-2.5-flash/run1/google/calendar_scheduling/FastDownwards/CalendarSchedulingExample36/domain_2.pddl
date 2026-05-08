(define (domain calendar-scheduling-example36)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
    )
    (:predicates
        (available ?p - person ?ts - time_slot)
        (next_slot ?ts1 - time_slot ?ts2 - time_slot)
        (denise_can_start_meeting_at ?ts - time_slot)
        (meeting_scheduled ?ts - time_slot)
    )

    (:action schedule_meeting
        :parameters (?start_ts - time_slot ?second_ts - time_slot)
        :precondition (and
            (not (exists (?any_ts - time_slot) (meeting_scheduled ?any_ts))) ; Only one meeting can be scheduled
            (next_slot ?start_ts ?second_ts)
            (available ryan ?start_ts)
            (available ryan ?second_ts)
            (available ruth ?start_ts)
            (available ruth ?second_ts)
            (available denise ?start_ts)
            (available denise ?second_ts)
            (denise_can_start_meeting_at ?start_ts)
        )
        :effect (and
            (meeting_scheduled ?start_ts)
        )
    )
)