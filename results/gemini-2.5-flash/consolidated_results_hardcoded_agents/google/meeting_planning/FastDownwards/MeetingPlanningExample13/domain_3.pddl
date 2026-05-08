(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types location)
    (:predicates
        (at ?l - location)
        (met_betty_75)
    )

    (:functions
        (T) ; Current time in minutes since 9:00 AM
        (total-cost) 
    )

    ;; Travel Presidio -> North Beach (18 min)
    (:action travel_p_to_nb
        :parameters ()
        :precondition (at presidio)
        :effect (and
            (not (at presidio))
            (at northbeach)
            (increase (T) 18)
            (increase (total-cost) 18)
        )
    )

    ;; Travel North Beach -> Presidio (17 min)
    (:action travel_nb_to_p
        :parameters ()
        :precondition (at northbeach)
        :effect (and
            (not (at northbeach))
            (at presidio)
            (increase (T) 17)
            (increase (total-cost) 17)
        )
    )

    ;; Wait 567 minutes at Presidio, allowing subsequent travel to reach NB at T=585. Requires T=0.
    (:action wait_p_until_567
        :parameters ()
        :precondition (and
            (at presidio)
            (= (T) 0)
        )
        :effect (and
            (increase (T) 567) 
            (increase (total-cost) 567)
        )
    )
    
    ;; Wait 567 minutes at North Beach, assuming arrival at T=18. Reaches T=585.
    (:action wait_nb_567_from_18
        :parameters ()
        :precondition (and
            (at northbeach)
            (= (T) 18)
        )
        :effect (and
            (increase (T) 567)
            (increase (total-cost) 567)
        )
    )

    ;; Meet Betty (75 minutes duration)
    ;; Must start at or after T=585 (6:45 PM)
    ;; Must start at or before T=705 (780 - 75 = 705)
    (:action meet_betty_for_75
        :parameters ()
        :precondition (and
            (at northbeach)
            (not (met_betty_75))
            (>= (T) 585) 
            (<= (T) 705) 
        )
        :effect (and
            (met_betty_75)
            (increase (T) 75)
            (increase (total-cost) 75)
        )
    )
)