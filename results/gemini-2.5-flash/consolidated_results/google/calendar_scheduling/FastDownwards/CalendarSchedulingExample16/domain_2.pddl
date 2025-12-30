(define (domain calendar-scheduling-v16)
    (:requirements :strips :typing :negative-preconditions)
    (:types time-slot - object
            person - object)

    (:constants scott gabriel christine - person)

    (:predicates
        (is-available ?p - person ?t - time-slot)
        (meeting-scheduled ?t - time-slot)
        (goal-achieved) ; Helper predicate for non-quantified goal
    )

    ;; Action to schedule the meeting if all required participants are available
    (:action schedule-meeting
        :parameters (?t - time-slot)
        :precondition (and
            (is-available scott ?t)
            (is-available gabriel ?t)
            (is-available christine ?t)
            (not (goal-achieved)) ; Ensure we only schedule the first meeting needed
        )
        :effect (and
            (meeting-scheduled ?t)
            (goal-achieved)
        )
    )
)