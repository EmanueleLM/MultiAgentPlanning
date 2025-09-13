(define (domain meeting-scheduling)
    (:requirements :strips :typing)

    (:types person time-slot)

    (:predicates
        (available ?p - person ?t - time-slot)
        (not-available ?p - person ?t - time-slot)
        (meeting-scheduled ?t - time-slot)
        (declared-available ?p - person ?t - time-slot)
        (participation-confirmed ?p - person ?t - time-slot)
    )

    (:action declare-availability-thomas
        :parameters (?t - time-slot)
        :precondition
        (available thomas ?t)
        :effect
        (declared-available thomas ?t)
    )

    (:action declare-availability-dylan
        :parameters (?t - time-slot)
        :precondition
        (and (available dylan ?t) (declared-available thomas ?t))
        :effect
        (declared-available dylan ?t)
    )

    (:action declare-availability-jerry
        :parameters (?t - time-slot)
        :precondition
        (and (available jerry ?t) (declared-available thomas ?t) (declared-available dylan ?t))
        :effect
        (declared-available jerry ?t)
    )

    (:action orchestrate-meeting
        :parameters (?t - time-slot)
        :precondition
        (and (declared-available thomas ?t) (declared-available dylan ?t) (declared-available jerry ?t))
        :effect
        (meeting-scheduled ?t)
    )
)