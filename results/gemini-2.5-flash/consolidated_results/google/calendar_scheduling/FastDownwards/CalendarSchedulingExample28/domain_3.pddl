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
            (available BRITTANY T1) (available EMILY T1) (available DORIS T1)
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
            (available BRITTANY T2) (available EMILY T2) (available DORIS T2)
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
            (available BRITTANY T3) (available EMILY T3) (available DORIS T3)
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
            (available BRITTANY T4) (available EMILY T4) (available DORIS T4)
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
            (available BRITTANY T5) (available EMILY T5) (available DORIS T5)
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
            (available BRITTANY T6) (available EMILY T6) (available DORIS T6)
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
            (available BRITTANY T7) (available EMILY T7) (available DORIS T7)
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
            (available BRITTANY T8) (available EMILY T8) (available DORIS T8)
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
            (available BRITTANY T9) (available EMILY T9) (available DORIS T9)
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
            (available BRITTANY T10) (available EMILY T10) (available DORIS T10)
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
            (available BRITTANY T11) (available EMILY T11) (available DORIS T11)
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
            (available BRITTANY T12) (available EMILY T12) (available DORIS T12)
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
            (available BRITTANY T13) (available EMILY T13) (available DORIS T13)
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
            (available BRITTANY T14) (available EMILY T14) (available DORIS T14)
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
            (available BRITTANY T15) (available EMILY T15) (available DORIS T15)
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
            (available BRITTANY T16) (available EMILY T16) (available DORIS T16)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T16)
            (increase (total-cost) 16)
        )
    )
)