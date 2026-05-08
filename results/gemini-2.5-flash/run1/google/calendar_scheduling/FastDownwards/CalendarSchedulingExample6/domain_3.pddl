(define (domain calendar_scheduling_example6)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        timeslot
    )
    (:predicates
        (available ?p - person ?s - timeslot)
        (meeting_scheduled)
        (meeting_at_slot ?s - timeslot)
    )

    (:action schedule_meeting
        :parameters (?s - timeslot)
        :precondition (and
            (available thomas ?s)
            (available dylan ?s)
            (available jerry ?s)
            (not (meeting_scheduled))
        )
        :effect (and
            (meeting_scheduled)
            (meeting_at_slot ?s)
        )
    )