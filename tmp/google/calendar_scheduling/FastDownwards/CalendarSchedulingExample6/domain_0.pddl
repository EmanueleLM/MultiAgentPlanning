(define (domain meeting-scheduling)
    (:requirements :strips :typing)

    (:types person time-slot)

    (:predicates
        (available ?p - person ?t - time-slot)
        (meeting-scheduled ?t - time-slot)
    )

    ;; Action for Thomas
    (:action check-thomas-availability
        :parameters (?t - time-slot)
        :precondition
        (available Thomas ?t)
        :effect
        (meeting-scheduled ?t)
    )

    ;; Action for Dylan
    (:action check-dylan-availability
        :parameters (?t - time-slot)
        :precondition
        (available Dylan ?t)
        :effect
        (meeting-scheduled ?t)
    )

    ;; Action for Jerry
    (:action check-jerry-availability
        :parameters (?t - time-slot)
        :precondition
        (available Jerry ?t)
        :effect
        (meeting-scheduled ?t)
    )

    ;; Combined action for scheduling meeting
    (:action schedule-meeting
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