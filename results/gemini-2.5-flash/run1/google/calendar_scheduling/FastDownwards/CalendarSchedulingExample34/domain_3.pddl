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
        ;; Predicates to identify the specific participants required for this meeting
        (is_willie ?p - person)
        (is_richard ?p - person)
        (is_noah ?p - person)
    )

    (:action schedule_one_hour_meeting
        :parameters (?t_start ?t_mid ?t_end - time_point
                     ?p_willie ?p_richard ?p_noah - person)
        :precondition (and
            ;; Ensure the parameters correspond to the specific people
            (is_willie ?p_willie)
            (is_richard ?p_richard)
            (is_noah ?p_noah)

            ;; A one-hour meeting spans two consecutive 30-minute slots
            (next ?t_start ?t_mid)
            (next ?t_mid ?t_end)
            ;; All required participants must be available for the first 30-minute slot
            (available ?p_willie ?t_start)
            (available ?p_richard ?t_start)
            (available ?p_noah ?t_start)
            ;; All required participants must be available for the second 30-minute slot
            (available ?p_willie ?t_mid)
            (available ?p_richard ?t_mid)
            (available ?p_noah ?t_mid)
        )
        :effect (and
            (meeting_scheduled ?t_start ?t_end)
        )
    )
)