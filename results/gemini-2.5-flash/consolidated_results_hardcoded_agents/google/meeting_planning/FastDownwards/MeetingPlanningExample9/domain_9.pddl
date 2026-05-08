(define (domain meeting-planning-strips)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    
    (:types
        location
    )

    (:predicates
        (at ?l - location)
        (mary-available)        
        (meeting-completed)
    )
    
    (:functions
        (total-cost) ; Standard cost fluent used to track elapsed time since T=540.
    )

    ;; 1. Travel Union Square to Nob Hill (9 min)
    (:action travel-us-nh
        :parameters ()
        :precondition (and 
            (at union-square)
        )
        :effect (and
            (not (at union-square))
            (at nob-hill)
            (increase (total-cost) 9)
        )
    )

    ;; 2. Wait until Mary is available (T=720)
    ;; Duration required after arriving at T=549: 720 - 549 = 171 minutes.
    (:action wait-for-mary
        :parameters ()
        :precondition (and
            (at nob-hill)
            (not (mary-available))
        )
        :effect (and
            (mary-available)
            (increase (total-cost) 171) 
        )
    )
    
    ;; 3. Meet Mary (Minimum required duration: 75 minutes)
    ;; Meeting runs from T=720 to T=795.
    (:action meet-mary-min-duration
        :parameters ()
        :precondition (and
            (at nob-hill)
            (mary-available)
            (not (meeting-completed))
        )
        :effect (and
            (meeting-completed)
            (increase (total-cost) 75)
        )
    )
)