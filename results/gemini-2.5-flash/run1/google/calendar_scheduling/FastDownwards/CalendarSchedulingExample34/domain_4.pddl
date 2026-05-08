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
        (meeting_scheduled_successfully)
        (is_willie ?p - person)
        (is_richard ?p - person)
        (is_noah ?p - person)
    )

    (:action schedule_one_hour_meeting
        :parameters (?t_start ?t_mid ?t_end - time_point
                     ?p_willie ?p_richard ?p_noah - person)
        :precondition (and
            (is_willie ?p_willie)
            (is_richard ?p_richard)
            (is_noah ?p_noah)

            (next ?t_start ?t_mid)
            (next ?t_mid ?t_end)

            (available ?p_willie ?t_start)
            (available ?p_richard ?t_start)
            (available ?p_noah ?t_start)
            (available ?p_willie ?t_mid)
            (available ?p_richard ?t_mid)
            (available ?p_noah ?t_mid)

            (not (meeting_scheduled_successfully))
        )
        :effect (and
            (meeting_scheduled ?t_start ?t_end)
            (meeting_scheduled_successfully)
        )
    )
)