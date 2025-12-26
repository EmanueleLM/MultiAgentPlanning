(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        participant
        time-slot
    )
    (:predicates
        (available ?p - participant ?t - time-slot)
        (meeting-scheduled ?t - time-slot)
        (found-solution)
    )

    (:action schedule-meeting
        :parameters (?t - time-slot)
        :precondition (and
            (available raymond ?t)
            (available billy ?t)
            (available donald ?t)
            (not (found-solution))
        )
        :effect (and
            (meeting-scheduled ?t)
            (found-solution)
        )
    )