(define (domain MeetingPlanning_Time_Axioms)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types location)
    
    (:predicates
        (at ?l - location) ; Traveler location
        (met-barbara) ; Goal state achieved: Barbara met for 90 minutes
    )
    
    (:functions
        (total-cost) ; Represents time elapsed in minutes (T=0 at 9:00 AM)
    )

    ;; 1. Travel from Bayview to Golden Gate Park (Duration 22 min)
    (:action travel-b-to-ggp
        :parameters ()
        :precondition (and
            (at BAYVIEW)
        )
        :effect (and
            (not (at BAYVIEW))
            (at GGP)
            (increase (total-cost) 22)
        )
    )

    ;; 2. Meet Barbara for 90 minutes at GGP
    (:action meet-barbara
        :parameters ()
        :precondition (and
            (at GGP)
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
        :precondition (and
            (at GGP)
        )
        :effect (and
            (not (at GGP))
            (at BAYVIEW)
            (increase (total-cost) 23)
        )
    )
)