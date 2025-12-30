(define (domain MeetingPlanningSTRIPS)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types location)
    (:predicates
        (at ?l - location) ; Traveler location
        (met-barbara)
    )
    (:functions
        (total-cost) ; Represents elapsed time in minutes from 9:00 AM (T=0)
    )

    ;; 1. Travel Action (Bayview -> GGP, Duration 22 minutes)
    (:action travel-b-to-ggp
        :parameters ()
        :precondition (at bayview)
        :effect (and
            (not (at bayview))
            (at ggp)
            (increase (total-cost) 22)
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
            (met-barbara)
            (increase (total-cost) 90)
        )
    )
    
    ;; 3. Return Travel (GGP -> Bayview, 23 minutes)
    (:action travel-ggp-to-b
        :parameters ()
        :precondition (at ggp)
        :effect (and
            (not (at ggp))
            (at bayview)
            (increase (total-cost) 23)
        )
    )
)