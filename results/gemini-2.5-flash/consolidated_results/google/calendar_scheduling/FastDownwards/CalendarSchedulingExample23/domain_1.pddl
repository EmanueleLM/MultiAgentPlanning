(define (domain CalendarScheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time
    )
    (:constants
        billy maria william - person
    )

    (:predicates
        (is-available ?p - person ?t - time)
        (meeting-scheduled ?t - time)
        (is-goal-achieved)
    )

    (:action schedule_meeting
        :parameters (?t - time)
        :precondition (and
            (is-available billy ?t)
            (is-available maria ?t)
            (is-available william ?t)
            (not (is-goal-achieved))
        )
        :effect (and
            (meeting-scheduled ?t)
            (is-goal-achieved)
        )
    )
)