(define (domain calendar-scheduling)
    (:requirements :strips :typing)
    (:types
        person
        time-slot
    )
    (:constants
        kathryn charlotte lauren - person
    )
    (:predicates
        (available ?p - person ?s - time-slot)
        (meeting-scheduled ?s - time-slot)
        (meeting-chosen)
    )
    (:action schedule-meeting
        :parameters (?s - time-slot)
        :precondition (and
            (available kathryn ?s)
            (available charlotte ?s)
            (available lauren ?s)
        )
        :effect (and
            (meeting-scheduled ?s)
            (meeting-chosen)
        )
    )
)