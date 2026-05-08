(define (domain calendar-scheduling)
    (:requirements :strips :typing) ; Removed :negative-preconditions as it's not strictly used and simplifies requirements if possible.
    (:types
        person
        time-slot
    )
    (:predicates
        (available ?p - person ?s - time-slot)
        (meeting-scheduled ?s - time-slot)
        (meeting-chosen)
    )
    (:action schedule-meeting
        :parameters (?s - time-slot)
        :precondition (and
            (available kathryn ?s)    ; Refer directly to the specific person objects
            (available charlotte ?s)
            (available lauren ?s)
        )
        :effect (and
            (meeting-scheduled ?s)
            (meeting-chosen)
        )
    )
)