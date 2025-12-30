(define (domain calendar-scheduling)
    (:requirements :strips :typing)
    (:types
        time-slot - object
        agent - object
    )
    (:constants
        arthur michael samantha - agent
    )

    (:predicates
        (is-available ?s - time-slot ?a - agent)
        (meeting-done)
    )

    (:action schedule-meeting
        :parameters (?s - time-slot)
        :precondition (and
            (is-available ?s arthur)
            (is-available ?s michael)
            (is-available ?s samantha)
        )
        :effect (meeting-done)
    )
)