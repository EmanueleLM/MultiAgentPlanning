(define (domain calendar-scheduling)
    (:requirements :strips :typing)
    (:types
        agent
        slot
    )
    (:constants
        kathryn charlotte lauren - agent
    )
    (:predicates
        (available ?s - slot ?a - agent)
        (meeting-scheduled ?s - slot)
    )

    (:action schedule-meeting
        :parameters (?s - slot)
        :precondition (and
            (available ?s kathryn)
            (available ?s charlotte)
            (available ?s lauren)
        )
        :effect (meeting-scheduled ?s)
    )
)