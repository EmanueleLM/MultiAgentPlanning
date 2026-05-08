(define (domain calendar_scheduling_example9)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        person
        time_point
        meeting_slot
    )
    (:predicates
        (next-time-point ?t1 - time_point ?t2 - time_point)
        (slot-starts-at ?s - meeting_slot ?t - time_point)
        (available-at ?p - person ?t - time_point) ; ?p is available for a 30-min meeting starting at ?t
        (meeting-scheduled ?s - meeting_slot)
        (scheduled-one-meeting) ; Invariant to ensure only one meeting is scheduled
    )

    (:action schedule-meeting
        :parameters (?s - meeting_slot ?t - time_point ?p1 - person ?p2 - person ?p3 - person)
        :precondition (and
            (slot-starts-at ?s ?t)
            (available-at ?p1 ?t)
            (available-at ?p2 ?t)
            (available-at ?p3 ?t)
            (not (scheduled-one-meeting))
        )
        :effect (and
            (meeting-scheduled ?s)
            (scheduled-one-meeting)
        )
    )
)