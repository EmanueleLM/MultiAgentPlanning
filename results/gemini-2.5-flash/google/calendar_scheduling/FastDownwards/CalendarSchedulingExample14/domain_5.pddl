(define (domain calendar_scheduling_example14)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        person
        time_slot
    )
    (:predicates
        (available ?p - person ?ts - time_slot)
        (is_preferred_slot ?ts - time_slot)
        (meeting_scheduled ?ts - time_slot)
    )
    (:functions (total-cost))

    (:action schedule_meeting_preferred
        :parameters (?ts - time_slot)
        :precondition (and
            (available brandon ?ts)
            (available jerry ?ts)
            (available bradley ?ts)
            (is_preferred_slot ?ts)
        )
        :effect (and
            (meeting_scheduled ?ts)
            (increase (total-cost) 1)
        )
    )

    ; Fallback actions with increasing costs to prioritize earlier non-preferred slots
    (:action schedule_meeting_fallback_t0900
        :parameters ()
        :precondition (and
            (available brandon t0900)
            (available jerry t0900)
            (available bradley t0900)
            (not (is_preferred_slot t0900))
        )
        :effect (and
            (meeting_scheduled t0900)
            (increase (total-cost) 2)
        )
    )

    (:action schedule_meeting_fallback_t0930
        :parameters ()
        :precondition (and
            (available brandon t0930)
            (available jerry t0930)
            (available bradley t0930)
            (not (is_preferred_slot t0930))
        )
        :effect (and
            (meeting_scheduled t0930)
            (increase (total-cost) 3)
        )
    )

    (:action schedule_meeting_fallback_t1000
        :parameters ()
        :precondition (and
            (available brandon t1000)
            (available jerry t1000)
            (available bradley t1000)
            (not (is_preferred_slot t1000))
        )
        :effect (and
            (meeting_scheduled t1000)
            (increase (total-cost) 4)
        )
    )

    (:action schedule_meeting_fallback_t1030
        :parameters ()
        :precondition (and
            (available brandon t1030)
            (available jerry t1030)
            (available bradley t1030)
            (not (is_preferred_slot t1030))
        )
        :effect (and
            (meeting_scheduled t1030)
            (increase (total-cost) 5)
        )
    )

    (:action schedule_meeting_fallback_t1100
        :parameters ()
        :precondition (and
            (available brandon t1100)
            (available jerry t1100)
            (available bradley t1100)
            (not (is_preferred_slot t1100))
        )
        :effect (and
            (meeting_scheduled t1100)
            (increase (total-cost) 6)
        )
    )

    (:action schedule_meeting_fallback_t1130
        :parameters ()
        :precondition (and
            (available brandon t1130)
            (available jerry t1130)
            (available bradley t1130)
            (not (is_preferred_slot t1130))
        )
        :effect (and
            (meeting_scheduled t1130)
            (increase (total-cost) 7)
        )
    )

    (:action schedule_meeting_fallback_t1200
        :parameters ()
        :precondition (and
            (available brandon t1200)
            (available jerry t1200)
            (available bradley t1200)
            (not (is_preferred_slot t1200))
        )
        :effect (and
            (meeting_scheduled t1200)
            (increase (total-cost) 8)
        )
    )

    (:action schedule_meeting_fallback_t1230
        :parameters ()
        :precondition (and
            (available brandon t1230)
            (available jerry t1230)
            (available bradley t1230)
            (not (is_preferred_slot t1230))
        )
        :effect (and
            (meeting_scheduled t1230)
            (increase (total-cost) 9)
        )
    )

    (:action schedule_meeting_fallback_t1300
        :parameters ()
        :precondition (and
            (available brandon t1300)
            (available jerry t1300)
            (available bradley t1300)
            (not (is_preferred_slot t1300))
        )
        :effect (and
            (meeting_scheduled t1300)
            (increase (total-cost) 10)
        )
    )

    (:action schedule_meeting_fallback_t1330
        :parameters ()
        :precondition (and
            (available brandon t1330)
            (available jerry t1330)
            (available bradley t1330)
            (not (is_preferred_slot t1330))
        )
        :effect (and
            (meeting_scheduled t1330)
            (increase (total-cost) 11)
        )
    )

    (:action schedule_meeting_fallback_t1400
        :parameters ()
        :precondition (and
            (available brandon t1400)
            (available jerry t1400)
            (available bradley t1400)
            (not (is_preferred_slot t1400))
        )
        :effect (and
            (meeting_scheduled t1400)
            (increase (total-cost) 12)
        )
    )
)