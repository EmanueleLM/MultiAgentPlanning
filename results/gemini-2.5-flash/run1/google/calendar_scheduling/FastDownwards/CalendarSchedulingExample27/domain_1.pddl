(define (domain calendar_scheduling_example_27)
    (:requirements :strips :typing)
    (:types time_slot)
    (:predicates
        (is_available ?t - time_slot)
        (meeting_scheduled ?t - time_slot)
    )

    (:action schedule_meeting
        :parameters (?t - time_slot)
        :precondition (is_available ?t)
        :effect (meeting_scheduled ?t)
    )
)