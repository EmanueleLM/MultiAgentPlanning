(define (domain calendar-scheduling-28)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        person
        time
    )
    (:predicates
        (available ?p - person ?t - time)
        (meeting-scheduled) ; Flag to ensure only one slot is chosen
        (selected-time ?t - time) ; Record which time was selected
    )

    (:functions
        (total-cost)
    )

    ;; Actions T1 (9:00) to T16 (16:30). Cost increases sequentially to prioritize earlier slots.
    
    (:action schedule-T1
        :parameters ()
        :precondition (and
            (available brittany T1) (available emily T1) (available doris T1)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T1)
            (increase (total-cost) 1)
        )
    )
    (:action schedule-T2
        :parameters ()
        :precondition (and
            (available brittany T2) (available emily T2) (available doris T2)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T2)
            (increase (total-cost) 2)
        )
    )
    (:action schedule-T3
        :parameters ()
        :precondition (and
            (available brittany T3) (available emily T3) (available doris T3)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T3)
            (increase (total-cost) 3)
        )
    )
    (:action schedule-T4
        :parameters ()
        :precondition (and
            (available brittany T4) (available emily T4) (available doris T4)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T4)
            (increase (total-cost) 4)
        )
    )
    (:action schedule-T5
        :parameters ()
        :precondition (and
            (available brittany T5) (available emily T5) (available doris T5)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T5)
            (increase (total-cost) 5)
        )
    )
    (:action schedule-T6
        :parameters ()
        :precondition (and
            (available brittany T6) (available emily T6) (available doris T6)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T6)
            (increase (total-cost) 6)
        )
    )
    (:action schedule-T7
        :parameters ()
        :precondition (and
            (available brittany T7) (available emily T7) (available doris T7)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T7)
            (increase (total-cost) 7)
        )
    )
    (:action schedule-T8
        :parameters ()
        :precondition (and
            (available brittany T8) (available emily T8) (available doris T8)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T8)
            (increase (total-cost) 8)
        )
    )
    (:action schedule-T9
        :parameters ()
        :precondition (and
            (available brittany T9) (available emily T9) (available doris T9)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T9)
            (increase (total-cost) 9)
        )
    )
    (:action schedule-T10
        :parameters ()
        :precondition (and
            (available brittany T10) (available emily T10) (available doris T10)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T10)
            (increase (total-cost) 10)
        )
    )
    (:action schedule-T11
        :parameters ()
        :precondition (and
            (available brittany T11) (available emily T11) (available doris T11)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T11)
            (increase (total-cost) 11)
        )
    )
    (:action schedule-T12
        :parameters ()
        :precondition (and
            (available brittany T12) (available emily T12) (available doris T12)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T12)
            (increase (total-cost) 12)
        )
    )
    (:action schedule-T13
        :parameters ()
        :precondition (and
            (available brittany T13) (available emily T13) (available doris T13)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T13)
            (increase (total-cost) 13)
        )
    )
    (:action schedule-T14
        :parameters ()
        :precondition (and
            (available brittany T14) (available emily T14) (available doris T14)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T14)
            (increase (total-cost) 14)
        )
    )
    (:action schedule-T15
        :parameters ()
        :precondition (and
            (available brittany T15) (available emily T15) (available doris T15)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T15)
            (increase (total-cost) 15)
        )
    )
    (:action schedule-T16
        :parameters ()
        :precondition (and
            (available brittany T16) (available emily T16) (available doris T16)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T16)
            (increase (total-cost) 16)
        )
    )
)