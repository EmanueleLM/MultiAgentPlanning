(define (domain calendar-scheduling-18)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        slot - object
        preferred-slot - slot ; Slots T8, T9 (No preference violation)
        penalized-slot - slot ; Slot T15 (Violates preference: starts >= 15:30)
    )
    (:predicates
        (chosen ?s - slot)
        (chosen-yet) ; Flag to ensure only one slot is chosen
    )
    (:functions
        (total-cost)
    )

    ;; Action for scheduling a slot that respects the preference (Cost 0)
    (:action schedule-preferred
        :parameters (?s - preferred-slot)
        :precondition (not (chosen-yet))
        :effect (and
            (chosen ?s)
            (chosen-yet)
        )
    )

    ;; Action for scheduling a slot that violates the preference (Cost 10)
    (:action schedule-penalized
        :parameters (?s - penalized-slot)
        :precondition (not (chosen-yet))
        :effect (and
            (chosen ?s)
            (chosen-yet)
            (increase (total-cost) 10)
        )
    )
)