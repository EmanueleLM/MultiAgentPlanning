(define (domain meeting-scheduling)
    (:requirements :strips :typing)

    (:types person time-slot)

    (:predicates
        (available ?p - person ?t - time-slot)
        (not-available ?p - person ?t - time-slot)
        (meeting-scheduled ?t - time-slot)
        (declared-available ?p - person ?t - time-slot)
    )

    (:action declare-availability-thomas
        :parameters (?t - time-slot)
        :precondition
        (available Thomas ?t)
        :effect
        (declared-available Thomas ?t)
    )

    (:action declare-availability-dylan
        :parameters (?t - time-slot)
        :precondition
        (and (available Dylan ?t) (declared-available Thomas ?t))
        :effect
        (declared-available Dylan ?t)
    )

    (:action declare-availability-jerry
        :parameters (?t - time-slot)
        :precondition
        (and (available Jerry ?t) (declared-available Dylan ?t))
        :effect
        (declared-available Jerry ?t)
    )

    (:action orchestrate-meeting
        :parameters (?t - time-slot)
        :precondition
        (declared-available Jerry ?t)
        :effect
        (meeting-scheduled ?t)
    )
)