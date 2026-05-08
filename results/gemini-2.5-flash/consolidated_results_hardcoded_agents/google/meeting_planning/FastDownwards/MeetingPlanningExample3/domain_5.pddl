(define (domain MeetingPlanningSTRIPS)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types location)
    (:predicates
        (at ?l - location) ; Traveler location
        (met-barbara) ; Goal state achieved
    )
    (:functions
        (total-time) ; Time in minutes accumulated
    )

    ;; 1. Travel Action (Bayview -> GGP, Duration 22 minutes)
    (:action travel-b-to-ggp
        :parameters ()
        :precondition (and
            (at bayview)
        )
        :effect (and
            (not (at bayview))
            (at ggp)
            (increase (total-time) 22)
        )
    )

    ;; 2. Meeting Action (Duration exactly 90 minutes)
    (:action meet-barbara-90min
        :parameters ()
        :precondition (and
            (at ggp)
            (not (met-barbara))
        )
        :effect (and
            (increase (total-time) 90)
            (met-barbara) 
        )
    )
    
    ;; 3. Return Travel (GGP -> Bayview, 23 minutes)
    (:action travel-ggp-to-b
        :parameters ()
        :precondition (and
            (at ggp)
        )
        :effect (and
            (not (at ggp))
            (at bayview)
            (increase (total-time) 23)
        )
    )
)