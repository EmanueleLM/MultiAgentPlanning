(define (domain calendar_scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_point
    )
    (:constants
        gerald roy barbara - person
    )
    (:predicates
        (is_available ?p - person ?t - time_point)
        (next_time ?t1 - time_point ?t2 - time_point) ; Temporal progression (not strictly used in this specific action, but good practice)
        (meeting_scheduled ?t - time_point)
        (is_preferred_slot ?t - time_point) ; Slot starts at or after 13:00 for Gerald's preference
    )

    (:action schedule_meeting
        :parameters (?t - time_point)
        :precondition (and
            (not (exists (?s - time_point) (meeting_scheduled ?s))) ; Ensure only one meeting is scheduled
            (is_available gerald ?t)
            (is_available roy ?t)
            (is_available barbara ?t)
            (is_preferred_slot ?t) ; Hard constraint: meeting must respect Gerald's preference
        )
        :effect (and
            (meeting_scheduled ?t)
        )
    )
)