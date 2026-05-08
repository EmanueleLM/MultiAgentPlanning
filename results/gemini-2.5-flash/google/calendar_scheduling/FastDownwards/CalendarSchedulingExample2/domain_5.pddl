(define (domain calendar_scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types timeslot)
    (:predicates
        (available_roy ?s - timeslot)
        (available_kathryn ?s - timeslot)
        (available_amy ?s - timeslot)
        (preferred_amy ?s - timeslot) ; Amy's preference: start 15:30 or earlier
        (meeting_scheduled ?s - timeslot) ; A specific meeting has been scheduled
        (meeting_scheduled_flag) ; A flag to ensure only one meeting is chosen and goal is met
        (has_viable_preferred_slot) ; True if at least one common preferred slot exists
    )

    (:action schedule_preferred_meeting
        :parameters (?s - timeslot)
        :precondition (and
            (available_roy ?s)
            (available_kathryn ?s)
            (available_amy ?s)
            (preferred_amy ?s) ; This slot meets Amy's preference
            (not (meeting_scheduled_flag)) ; Only one meeting can be scheduled
        )
        :effect (and
            (meeting_scheduled ?s)
            (meeting_scheduled_flag)
        )
    )

    (:action schedule_non_preferred_meeting
        :parameters (?s - timeslot)
        :precondition (and
            (available_roy ?s)
            (available_kathryn ?s)
            (available_amy ?s)
            (not (preferred_amy ?s)) ; This slot does NOT meet Amy's preference
            (not (meeting_scheduled_flag)) ; Only one meeting can be scheduled
            (not (has_viable_preferred_slot)) ; ONLY allow non-preferred if NO preferred slot is viable
        )
        :effect (and
            (meeting_scheduled ?s)
            (meeting_scheduled_flag)
        )
    )
)