(define (domain meeting-scheduling)
    (:requirements :strips :typing :existential-preconditions)

    (:types person time-slot)

    (:predicates
        (available ?p - person ?t - time-slot)
        (not-available ?p - person ?t - time-slot)
        (meeting-scheduled ?t - time-slot)
    )

    ;; Actions for each agent to declare their availability
    (:action declare-availability
        :parameters (?p - person ?t - time-slot)
        :precondition
        (available ?p ?t)
        :effect
        (meeting-scheduled ?t)
    )

    ;; Combined action for orchestrator to schedule meeting
    (:action orchestrate-meeting
        :parameters (?t - time-slot)
        :precondition
        (and
            (available Thomas ?t)
            (available Dylan ?t)
            (available Jerry ?t)
        )
        :effect
        (meeting-scheduled ?t)
    )
)