(define (domain meeting-schedule)
    (:requirements :typing :durative-actions :action-costs)
    (:types 
        location
    )
    (:predicates
        (at ?l - location)
        (met_john)
    )
    (:functions
        (total-cost)
    )

    ;; 1. Travel from GGP to PH (16 min)
    (:durative-action travel_ggp_to_ph
        :parameters ()
        :duration (= ?duration 16)
        :condition (and 
            (at start (at ggp))
        )
        :effect (and
            (at start (not (at ggp)))
            (at end (at ph))
            (increase (total-cost) 1)
        )
    )

    ;; 2. Meet John (Minimum 45 min)
    (:durative-action meet_john
        :parameters ()
        :duration (>= ?duration 45)
        :condition (and 
            (at start (at ph))
        )
        :effect (and
            (at end (met_john))
        )
    )
    
    ;; 3. Waiting action (Allows bridging the time gap)
    (:durative-action wait
        :parameters (?l - location)
        :duration (>= ?duration 0)
        :condition (at start (at ?l))
        :effect (and 
            (at end (at ?l))
            (increase (total-cost) (* #t 0.01)) ; Minimal cost accumulation for time passed
        )
    )
)