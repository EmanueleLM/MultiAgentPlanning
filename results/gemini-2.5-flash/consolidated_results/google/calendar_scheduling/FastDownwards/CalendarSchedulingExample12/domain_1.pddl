(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        time_slot - object
    )
    (:predicates
        (available_david ?t - time_slot)
        (available_debra ?t - time_slot)
        (available_kevin ?t - time_slot)
        (slot_selected ?t - time_slot)
        (meeting_scheduled)
    )

    (:action schedule_meeting
        :parameters (?t - time_slot)
        :precondition (and
            (available_david ?t)
            (available_debra ?t)
            (available_kevin ?t)
            (not (meeting_scheduled))
        )
        :effect (and
            (slot_selected ?t)
            (meeting_scheduled)
        )
    )
)