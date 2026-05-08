(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types location)
    (:constants
        presidio northbeach - location
    )

    (:predicates
        (at ?l - location)
        (met-betty)
    )

    (:functions
        (t) ; Current time in minutes since 9:00 AM
        (total-cost) 
    )

    ;; Travel Presidio -> North Beach (18 min)
    (:action travel-p-to-nb
        :parameters ()
        :precondition (at presidio)
        :effect (and
            (not (at presidio))
            (at northbeach)
            (increase (t) 18)
            (increase (total-cost) 18)
        )
    )

    ;; Travel North Beach -> Presidio (17 min)
    (:action travel-nb-to-p
        :parameters ()
        :precondition (at northbeach)
        :effect (and
            (not (at northbeach))
            (at presidio)
            (increase (t) 17)
            (increase (total-cost) 17)
        )
    )

    ;; Wait 567 minutes at Presidio (0 -> 567). Enables arrival at NB exactly at t=585 (6:45 PM).
    (:action wait-p-567
        :parameters ()
        :precondition (and
            (at presidio)
            (= (t) 0)
        )
        :effect (and
            (increase (t) 567) 
            (increase (total-cost) 567)
        )
    )
    
    ;; Wait 567 minutes at North Beach (18 -> 585). Requires prior P->NB travel.
    (:action wait-nb-567
        :parameters ()
        :precondition (and
            (at northbeach)
            (= (t) 18)
        )
        :effect (and
            (increase (t) 567)
            (increase (total-cost) 567)
        )
    )

    ;; Meet Betty (75 minutes duration)
    ;; Must start t >= 585 (6:45 PM)
    ;; Must end t <= 780 (10:00 PM). Therefore, start t <= 780 - 75 = 705.
    (:action meet-betty-for-75
        :parameters ()
        :precondition (and
            (at northbeach)
            (not (met-betty))
            (>= (t) 585) 
            (<= (t) 705) 
        )
        :effect (and
            (met-betty)
            (increase (t) 75)
            (increase (total-cost) 75)
        )
    )
)