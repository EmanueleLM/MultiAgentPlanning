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
        :parameters (?s - timeslot ?p1 - person ?p2 - person ?p3 - person)
        :precondition (and
            (available ?p1 ?s)
            (available ?p2 ?s)
            (available ?p3 ?s)
            (not (meeting_scheduled)) ; Ensure only one meeting is scheduled
        )
        :effect (and
            (meeting_scheduled)
            (meeting_at_slot ?s)
        )
    )
)