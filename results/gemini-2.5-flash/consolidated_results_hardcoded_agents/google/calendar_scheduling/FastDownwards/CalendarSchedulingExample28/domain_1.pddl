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
        :parameters (?b - person ?e - person ?d - person)
        :precondition (and
            (available ?b T1) (available ?e T1) (available ?d T1)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T1)
            (increase (total-cost) 1)
        )
    )
    (:action schedule-T2
        :parameters (?b - person ?e - person ?d - person)
        :precondition (and
            (available ?b T2) (available ?e T2) (available ?d T2)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T2)
            (increase (total-cost) 2)
        )
    )
    (:action schedule-T3
        :parameters (?b - person ?e - person ?d - person)
        :precondition (and
            (available ?b T3) (available ?e T3) (available ?d T3)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T3)
            (increase (total-cost) 3)
        )
    )
    (:action schedule-T4
        :parameters (?b - person ?e - person ?d - person)
        :precondition (and
            (available ?b T4) (available ?e T4) (available ?d T4)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T4)
            (increase (total-cost) 4)
        )
    )
    (:action schedule-T5
        :parameters (?b - person ?e - person ?d - person)
        :precondition (and
            (available ?b T5) (available ?e T5) (available ?d T5)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T5)
            (increase (total-cost) 5)
        )
    )
    (:action schedule-T6
        :parameters (?b - person ?e - person ?d - person)
        :precondition (and
            (available ?b T6) (available ?e T6) (available ?d T6)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T6)
            (increase (total-cost) 6)
        )
    )
    (:action schedule-T7
        :parameters (?b - person ?e - person ?d - person)
        :precondition (and
            (available ?b T7) (available ?e T7) (available ?d T7)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T7)
            (increase (total-cost) 7)
        )
    )
    (:action schedule-T8
        :parameters (?b - person ?e - person ?d - person)
        :precondition (and
            (available ?b T8) (available ?e T8) (available ?d T8)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T8)
            (increase (total-cost) 8)
        )
    )
    (:action schedule-T9
        :parameters (?b - person ?e - person ?d - person)
        :precondition (and
            (available ?b T9) (available ?e T9) (available ?d T9)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T9)
            (increase (total-cost) 9)
        )
    )
    (:action schedule-T10
        :parameters (?b - person ?e - person ?d - person)
        :precondition (and
            (available ?b T10) (available ?e T10) (available ?d T10)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T10)
            (increase (total-cost) 10)
        )
    )
    (:action schedule-T11
        :parameters (?b - person ?e - person ?d - person)
        :precondition (and
            (available ?b T11) (available ?e T11) (available ?d T11)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T11)
            (increase (total-cost) 11)
        )
    )
    (:action schedule-T12
        :parameters (?b - person ?e - person ?d - person)
        :precondition (and
            (available ?b T12) (available ?e T12) (available ?d T12)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T12)
            (increase (total-cost) 12)
        )
    )
    (:action schedule-T13
        :parameters (?b - person ?e - person ?d - person)
        :precondition (and
            (available ?b T13) (available ?e T13) (available ?d T13)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T13)
            (increase (total-cost) 13)
        )
    )
    (:action schedule-T14
        :parameters (?b - person ?e - person ?d - person)
        :precondition (and
            (available ?b T14) (available ?e T14) (available ?d T14)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T14)
            (increase (total-cost) 14)
        )
    )
    (:action schedule-T15
        :parameters (?b - person ?e - person ?d - person)
        :precondition (and
            (available ?b T15) (available ?e T15) (available ?d T15)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T15)
            (increase (total-cost) 15)
        )
    )
    (:action schedule-T16
        :parameters (?b - person ?e - person ?d - person)
        :precondition (and
            (available ?b T16) (available ?e T16) (available ?d T16)
            (not (meeting-scheduled))
        )
        :effect (and
            (meeting-scheduled)
            (selected-time T16)
            (increase (total-cost) 16)
        )
    )
)