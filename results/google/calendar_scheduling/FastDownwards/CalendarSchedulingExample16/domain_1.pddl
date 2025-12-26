(define (domain calendar-scheduling-v16)
    (:requirements :strips :typing :negative-preconditions)
    (:types time-slot - object
            person - object)

    (:constants scott gabriel christine - person)

    (:predicates
        (is-available ?p - person ?t - time-slot)
        (meeting-scheduled ?t - time-slot)
    )

    ;; Action to schedule the meeting if all required participants are available
    (:action schedule-meeting
        :parameters (?t - time-slot)
        :precondition (and
            (is-available scott ?t)
            (is-available gabriel ?t)
            (is-available christine ?t)
        )
        :effect (meeting-scheduled ?t)
    )
)