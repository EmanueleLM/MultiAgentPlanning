(define (domain calendar_scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_point
    )
    (:predicates
        (next-slot ?t1 - time_point ?t2 - time_point)
        (is-busy ?p - person ?t - time_point)
        (meeting-scheduled ?start_time - time_point)
    )

    (:action schedule-meeting
        :parameters (?start_time ?next_slot_time - time_point)
        :precondition (and
            (next-slot ?start_time ?next_slot_time)
            ;; Ensure all participants are free for the first 30-min slot
            (not (is-busy billy ?start_time))
            (not (is-busy maria ?start_time))
            (not (is-busy william ?start_time))
            ;; Ensure all participants are free for the second 30-min slot
            (not (is-busy billy ?next_slot_time))
            (not (is-busy maria ?next_slot_time))
            (not (is-busy william ?next_slot_time))
        )
        :effect (and
            (meeting-scheduled ?start_time)
        )
    )
)