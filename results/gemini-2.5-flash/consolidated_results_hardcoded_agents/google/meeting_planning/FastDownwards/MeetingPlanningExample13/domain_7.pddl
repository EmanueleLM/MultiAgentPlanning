(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types location)
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

    ;; Wait 567 minutes at Presidio (t=0 -> t=567). 
    ;; Allows subsequent travel (18 min) to reach NB exactly at t=585 (6:45 PM).
    (:action wait-p-until-567
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
    
    ;; Wait 567 minutes at North Beach (t=18 -> t=585).
    (:action wait-nb-567-from-18
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
    ;; Must start at or after t=585 (6:45 PM)
    ;; Must start at or before t=705 (780 - 75 = 705, where 780 is 10:00 PM)
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