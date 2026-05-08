(define (domain calendar_scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types timeslot)
    (:predicates
        (available_roy ?s - timeslot)
        (available_kathryn ?s - timeslot)
        (available_amy ?s - timeslot)
        (preferred ?s - timeslot) ; Amy's preference (start <= 15:30)
        (meeting_scheduled)
        (scheduled ?s - timeslot)
    )

    (:functions
        (total-cost)
    )

    ;; Action for scheduling a slot that meets Amy's preference (Low Cost)
    (:action schedule_preferred_meeting
        :parameters (?s - timeslot)
        :precondition (and
            (available_roy ?s)
            (available_kathryn ?s)
            (available_amy ?s)
            (preferred ?s)
            (not (meeting_scheduled))
        )
        :effect (and
            (scheduled ?s)
            (meeting_scheduled)
            (increase (total-cost) 1)
        )
    )

    ;; Action for scheduling a slot that does NOT meet Amy's preference (High Cost Penalty)
    (:action schedule_unpreferred_meeting
        :parameters (?s - timeslot)
        :precondition (and
            (available_roy ?s)
            (available_kathryn ?s)
            (available_amy ?s)
            (not (preferred ?s))
            (not (meeting_scheduled))
        )
        :effect (and
            (scheduled ?s)
            (meeting_scheduled)
            (increase (total-cost) 100)
        )
    )
)