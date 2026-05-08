(define (domain calendar-scheduling)
    (:requirements :strips :typing :action-costs)
    (:types
        timeslot - object
        agent - object
    )

    (:predicates
        (available ?a - agent ?t - timeslot)
        (meeting-scheduled ?t - timeslot)
        (slot-is-after-preference ?t - timeslot) ; Marks slots from 14:30 onwards (slot s11)
    )

    (:functions
        (total-cost)
    )

    (:action schedule-meeting
        :parameters (?s - timeslot)
        :precondition (and
            (available brandon ?s)
            (available jerry ?s)
            (available bradley ?s)
            (not (meeting-scheduled ?s)) ; Ensure only one meeting is scheduled
        )
        :effect (and
            (meeting-scheduled ?s)
            ; Award lower cost for preferred slots (after 14:30 / s11)
            (increase (total-cost) (when (slot-is-after-preference ?s) 1))
            ; Award higher cost for non-preferred slots (before 14:30 / s11)
            (increase (total-cost) (when (not (slot-is-after-preference ?s)) 10))
        )
    )
)