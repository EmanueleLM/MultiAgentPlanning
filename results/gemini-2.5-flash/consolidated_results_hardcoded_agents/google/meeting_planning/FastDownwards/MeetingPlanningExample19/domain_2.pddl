(define (domain meeting-scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
    )
    (:constants
        ggp - location
        ph - location
    )
    (:predicates
        (at ?l - location)
        (met_john)
    )

    (:functions
        (total-cost) ; Represents time elapsed in minutes from 9:00 AM
    )

    ;; Action representing the EARLIEST FEASIBLE schedule (ends at 8:30 PM):
    ;; Total elapsed time: 690 minutes. Meeting starts T=645, ends T=690.
    (:action schedule_meet_early
        :parameters ()
        :precondition (at ggp)
        :effect (and 
            (not (at ggp))
            (at ph)
            (met_john)
            (increase (total-cost) 690)
        )
    )

    ;; Action representing the LATEST FEASIBLE schedule (ends at 8:45 PM):
    ;; Total elapsed time: 705 minutes. Meeting starts T=660, ends T=705.
    (:action schedule_meet_late
        :parameters ()
        :precondition (at ggp)
        :effect (and 
            (not (at ggp))
            (at ph)
            (met_john)
            (increase (total-cost) 705)
        )
    )

    ;; Modeling the defined return journey (PH -> GGP: 15 min), 
    ;; though not required for the primary goal (met_john).
    (:action travel_back_to_ggp
        :parameters ()
        :precondition (and
            (at ph)
            (met_john)
        )
        :effect (and
            (not (at ph))
            (at ggp)
            (increase (total-cost) 15)
        )
    )
)