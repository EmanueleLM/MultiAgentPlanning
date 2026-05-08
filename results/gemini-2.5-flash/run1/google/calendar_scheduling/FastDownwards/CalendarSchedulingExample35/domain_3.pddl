(define (domain calendar_scheduling_example35)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_slot
    )
    (:predicates
        (is_person ?p - person)
        (is_time_slot ?t - time_slot)
        (available ?p - person ?t - time_slot)
        (preferred_by_bradley ?t - time_slot)
        (meeting_scheduled ?t - time_slot)
        (has_meeting_scheduled)
    )

    (:action schedule_meeting
        :parameters (?t - time_slot)
        :precondition (and
            (available bradley ?t)
            (available zachary ?t)
            (available teresa ?t)
            (preferred_by_bradley ?t)
            (not (has_meeting_scheduled))
        )
        :effect (and
            (meeting_scheduled ?t)
            (has_meeting_scheduled)
        )
    )