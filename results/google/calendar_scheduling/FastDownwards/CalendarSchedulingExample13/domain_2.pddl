(define (domain scheduling_c13)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        agent
        time-slot
    )

    (:constants
        gerald - agent
        roy - agent
        barbara - agent
        
        t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time-slot
    )

    (:predicates
        (available ?a - agent ?t - time-slot)
        (meeting-found)
        (non-preferred ?t - time-slot) 
    )

    (:functions
        (total-cost)
    )

    (:action schedule_meeting_preferred
        :parameters (?t - time-slot)
        :precondition (and
            (available gerald ?t)
            (available roy ?t)
            (available barbara ?t)
            (not (meeting-found))
            (not (non-preferred ?t))
        )
        :effect (and
            (meeting-found)
            (increase (total-cost) 0)
        )
    )

    (:action schedule_meeting_non_preferred
        :parameters (?t - time-slot)
        :precondition (and
            (available gerald ?t)
            (available roy ?t)
            (available barbara ?t)
            (not (meeting-found))
            (non-preferred ?t)
        )
        :effect (and
            (meeting-found)
            (increase (total-cost) 1)
        )
    )
)