(define (domain meeting-scheduling)
    (:requirements :strips :typing :existential-preconditions)

    (:types person time-slot)

    (:predicates
        (available ?p - person ?t - time-slot)
        (not-available ?p - person ?t - time-slot)
        (meeting-scheduled)
        (handled-declaration ?p - person)
    )

    (:action declare-availability-thomas
        :parameters (?t - time-slot)
        :precondition
        (and (available Thomas ?t) (not (meeting-scheduled)))
        :effect
        (handled-declaration Thomas)
    )

    (:action declare-availability-dylan
        :parameters (?t - time-slot)
        :precondition
        (and (available Dylan ?t) (handled-declaration Thomas) (not (meeting-scheduled)))
        :effect
        (handled-declaration Dylan)
    )

    (:action declare-availability-jerry
        :parameters (?t - time-slot)
        :precondition
        (and (available Jerry ?t) (handled-declaration Dylan) (not (meeting-scheduled)))
        :effect
        (handled-declaration Jerry)
    )

    (:action orchestrate-meeting
        :parameters (?t - time-slot)
        :precondition
        (and
            (handled-declaration Jerry)
        )
        :effect
        (meeting-scheduled)
    )
)