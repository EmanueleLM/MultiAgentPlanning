(define (domain calendar_scheduling)
    (:requirements :strips :typing)
    (:types timeslot)
    (:predicates
        (available_roy ?s - timeslot)
        (available_kathryn ?s - timeslot)
        (available_amy ?s - timeslot)
        (preferred_amy ?s - timeslot) ; Amy's preference: start 15:30 or earlier
        (meeting_scheduled ?s - timeslot) ; A specific meeting has been scheduled
        (has_chosen_slot) ; A flag to ensure only one meeting is chosen
    )

    (:action schedule_meeting
        :parameters (?s - timeslot)
        :precondition (and
            (available_roy ?s)
            (available_kathryn ?s)
            (available_amy ?s)
            (preferred_amy ?s) ; Enforce Amy's preference as a hard constraint for selection
            (not (has_chosen_slot)) ; Only one meeting can be scheduled
        )
        :effect (and
            (meeting_scheduled ?s)
            (has_chosen_slot)
        )
    )
)