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
        (meeting_not_yet_scheduled)
    )

    (:action schedule_meeting
        :parameters (?start_ts - time_slot ?second_ts - time_slot)
        :precondition (and
            (meeting_not_yet_scheduled) ; Ensures only one meeting can be scheduled
            (next_slot ?start_ts ?second_ts) ; A 1-hour meeting needs two 30-min slots
            (available ryan ?start_ts)
            (available ryan ?second_ts)
            (available ruth ?start_ts)
            (available ruth ?second_ts)
            (available denise ?start_ts)
            (available denise ?second_ts)
            (denise_can_start_meeting_at ?start_ts)
        )
        :effect (and
            (meeting_scheduled_at ?start_ts)
            (not (meeting_not_yet_scheduled))
        )
    )
)