(define (domain calendar-scheduling-18)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        slot - object
    )
    (:predicates
        (available ?s - slot)
        (chosen ?s - slot)
        (violates-preference ?s - slot)
        (chosen-yet)
    )
    (:functions
        (total-cost)
    )

    (:action schedule-preferred
        :parameters (?s - slot)
        :precondition (and 
            (available ?s)
            (not (chosen-yet))
            (not (violates-preference ?s)) ; Slot does not violate preference (Cost 0)
        )
        :effect (and
            (chosen ?s)
            (chosen-yet)
        )
    )

    (:action schedule-violated
        :parameters (?s - slot)
        :precondition (and 
            (available ?s)
            (not (chosen-yet))
            (violates-preference ?s) ; Slot violates preference (Cost 10)
        )
        :effect (and
            (chosen ?s)
            (chosen-yet)
            (increase (total-cost) 10)
        )
    )
)