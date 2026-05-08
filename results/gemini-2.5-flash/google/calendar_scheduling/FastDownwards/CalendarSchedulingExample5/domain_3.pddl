(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time-slot
    )
    (:predicates
        (available ?p - person ?s - time-slot)
        (meeting-scheduled ?s - time-slot)
        (meeting-chosen) ; Added predicate to represent that a meeting has been chosen
    )
    (:action schedule-meeting
        :parameters (?s - time-slot
                     ?kathryn_p - person
                     ?charlotte_p - person
                     ?lauren_p - person)
        :precondition (and
            (available ?kathryn_p ?s)
            (available ?charlotte_p ?s)
            (available ?lauren_p ?s)
        )
        :effect (and
            (meeting-scheduled ?s)
            (meeting-chosen) ; Achieve the dummy goal predicate
        )
    )
)