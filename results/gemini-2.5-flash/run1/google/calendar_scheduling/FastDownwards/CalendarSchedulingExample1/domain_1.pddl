(define (domain calendar_scheduling)
    (:requirements :strips :typing :negative-preconditions :existential-preconditions) ; :existential-preconditions for goal
    (:types
        person
        time-slot
    )
    (:predicates
        (available ?p - person ?s - time-slot)
        (meeting_scheduled ?s - time-slot)
        (no_meeting_scheduled) ; Invariant to ensure only one meeting is scheduled
    )

    (:action schedule_meeting
        :parameters (?s - time-slot)
        :precondition (and
            (available raymond ?s)
            (available billy ?s)
            (available donald ?s)
            (no_meeting_scheduled)
        )
        :effect (and
            (meeting_scheduled ?s)
            (not (no_meeting_scheduled))
        )
    )
)