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
        (meeting_scheduled_at ?ts - time_slot)
    )

    (:action schedule_meeting
        :parameters (?start_ts - time_slot ?next_ts - time_slot)
        :precondition (and
            (not (exists (?any_ts - time_slot) (meeting_scheduled_at ?any_ts))) ; Only one meeting can be scheduled
            (next_slot ?start_ts ?next_ts)
            (available ryan ?start_ts)
            (available ryan ?next_ts)
            (available ruth ?start_ts)
            (available ruth ?next_ts)
            (available denise ?start_ts)
            (available denise ?next_ts)
            (denise_can_start_meeting_at ?start_ts)
        )
        :effect (and
            (meeting_scheduled_at ?start_ts)
        )
    )
)