(define (domain calendar_scheduling_example34)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_point
    )
    (:predicates
        (available ?p - person ?tp - time_point)
        (next ?tp1 ?tp2 - time_point)
        (meeting_scheduled ?t_start ?t_end - time_point)
    )

    (:action schedule_one_hour_meeting
        :parameters (?t_start ?t_mid ?t_end - time_point)
        :precondition (and
            ;; A one-hour meeting spans two consecutive 30-minute slots
            (next ?t_start ?t_mid)
            (next ?t_mid ?t_end)
            ;; All required participants must be available for the first 30-minute slot
            (available willie ?t_start)
            (available richard ?t_start)
            (available noah ?t_start)
            ;; All required participants must be available for the second 30-minute slot
            (available willie ?t_mid)
            (available richard ?t_mid)
            (available noah ?t_mid)
        )
        :effect (and
            (meeting_scheduled ?t_start ?t_end)
        )
    )
)