(define (domain calendar-scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        time-point - object
        person - object
    )

    (:predicates
        (next-time ?t1 - time-point ?t2 - time-point)
        (is-blocked ?p - person ?t - time-point)
        (meeting-scheduled ?t_start - time-point)
        (meeting-achieved)
    )

    (:action schedule-meeting
        :parameters (?start - time-point ?mid - time-point ?end - time-point)
        :precondition (and
            (next-time ?start ?mid)
            (next-time ?mid ?end)

            (not (is-blocked michelle ?start))
            (not (is-blocked michelle ?mid))

            (not (is-blocked steven ?start))
            (not (is-blocked steven ?mid))

            (not (is-blocked jerry ?start))
            (not (is-blocked jerry ?mid))
        )
        :effect (and
            (meeting-scheduled ?start)
            (meeting-achieved)
        )
    )
)