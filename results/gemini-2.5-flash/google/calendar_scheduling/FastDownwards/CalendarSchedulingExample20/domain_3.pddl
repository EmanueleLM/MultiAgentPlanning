(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions) ; :negative-preconditions is included as a common extension.
    (:types
        person
        timeslot
    )
    (:predicates
        (available ?p - person ?t - timeslot)
        (meeting_scheduled ?t - timeslot)
    )
    (:action schedule_meeting
        :parameters (?t - timeslot)
        :precondition (and
            (available ralph ?t)
            (available peter ?t)
            (available daniel ?t)
        )
        :effect (meeting_scheduled ?t)
    )
)