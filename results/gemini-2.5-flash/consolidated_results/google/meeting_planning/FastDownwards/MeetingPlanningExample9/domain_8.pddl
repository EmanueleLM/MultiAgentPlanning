(define (domain meeting-planning-strips)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    
    (:types
        location
    )

    (:predicates
        (at ?l - location)
        (mary-available)        ; Available from T=720
        (meeting-completed)
    )
    
    (:functions
        (total-time) ; Time elapsed since the start time (T=540). Used for cost minimization.
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
            (increase (total-time) 9)
        )
    )

    ;; 2. Wait until Mary is available (T=720)
    ;; Time required: 171 minutes (T_abs: 549 -> 720).
    (:action wait-for-mary
        :parameters ()
        :precondition (and
            (at nob-hill)
            (not (mary-available))
        )
        :effect (and
            (mary-available)
            (increase (total-time) 171) 
        )
    )
    
    ;; 3. Meet Mary (Minimum required duration: 75 minutes)
    ;; T_start=720. T_end=795. This satisfies the constraint 720 <= T_start and T_end <= 975.
    (:action meet-mary-min-duration
        :parameters ()
        :precondition (and
            (at nob-hill)
            (mary-available)
            (not (meeting-completed))
        )
        :effect (and
            (meeting-completed)
            (increase (total-time) 75)
        )
    )
)