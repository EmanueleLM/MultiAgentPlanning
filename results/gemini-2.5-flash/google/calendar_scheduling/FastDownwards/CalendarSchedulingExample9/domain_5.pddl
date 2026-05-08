(define (domain calendar_scheduling_example9)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        time_point
        meeting_slot
        person
    )
    (:constants
        diane kelly deborah - person
    )
    (:predicates
        (next-time-point ?t1 - time_point ?t2 - time_point)
        (slot-starts-at ?s - meeting_slot ?t - time_point)
        (available-at ?p - person ?t - time_point) ; ?p is available for a 30-min meeting starting at ?t
        (meeting-scheduled ?s - meeting_slot)
        (scheduled-one-meeting) ; Invariant to ensure only one meeting is scheduled
    )
    (:functions
        (total-cost)
        (time-cost ?t - time_point)
    )

    (:action schedule-meeting
        :parameters (?s - meeting_slot ?t - time_point)
        :precondition (and
            (slot-starts-at ?s ?t)
            (available-at diane ?t) ; Explicitly check for Diane's availability
            (available-at kelly ?t) ; Explicitly check for Kelly's availability
            (available-at deborah ?t) ; Explicitly check for Deborah's availability
            (not (scheduled-one-meeting))
        )
        :effect (and
            (meeting-scheduled ?s)
            (scheduled-one-meeting)
            (increase (total-cost) (time-cost ?t)) ; Add the cost of scheduling at this time point
        )
    )
)