(define (domain calendar_scheduling_example7)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
    )

    (:predicates
        (person_available ?p - person ?t - time_slot)
        (has_preference_not_after ?p - person ?t - time_slot)
        (meeting_scheduled ?t - time_slot)
    )

    (:action schedule_meeting
        :parameters (?t - time_slot)
        :precondition (and
            (person_available heather ?t)
            (person_available nicholas ?t)
            (person_available zachary ?t)
            (not (has_preference_not_after zachary ?t))
        )
        :effect (and
            (meeting_scheduled ?t)
        )
    )
)