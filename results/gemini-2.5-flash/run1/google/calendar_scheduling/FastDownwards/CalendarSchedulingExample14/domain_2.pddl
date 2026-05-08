(define (domain calendar-scheduling)
    (:requirements :strips :typing :action-costs :negative-preconditions)
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

    ;; Action to schedule a meeting in a preferred timeslot (after 14:30)
    (:action schedule-meeting-preferred
        :parameters (?s - timeslot)
        :precondition (and
            (available brandon ?s)
            (available jerry ?s)
            (available bradley ?s)
            (not (meeting-scheduled ?s)) ; Ensure only one meeting is scheduled
            (slot-is-after-preference ?s) ; This slot must be preferred
        )
        :effect (and
            (meeting-scheduled ?s)
            (increase (total-cost) 1) ; Lower cost for preferred slots
        )
    )

    ;; Action to schedule a meeting in a non-preferred timeslot (before 14:30)
    (:action schedule-meeting-non-preferred
        :parameters (?s - timeslot)
        :precondition (and
            (available brandon ?s)
            (available jerry ?s)
            (available bradley ?s)
            (not (meeting-scheduled ?s)) ; Ensure only one meeting is scheduled
            (not (slot-is-after-preference ?s)) ; This slot must NOT be preferred
        )
        :effect (and
            (meeting-scheduled ?s)
            (increase (total-cost) 10) ; Higher cost for non-preferred slots
        )
    )
)