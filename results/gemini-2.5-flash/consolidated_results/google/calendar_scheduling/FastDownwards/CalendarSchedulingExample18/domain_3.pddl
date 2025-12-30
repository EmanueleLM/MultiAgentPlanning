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

    (:action schedule-meeting
        :parameters (?s - slot)
        :precondition (and 
            (available ?s)
            (not (chosen-yet))
        )
        :effect (and
            (chosen ?s)
            (chosen-yet)
            (when (violates-preference ?s)
                (increase (total-cost) 10)
            )
        )
    )
)