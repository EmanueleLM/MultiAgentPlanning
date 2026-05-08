(define (domain meeting-schedule)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types location - object)

    (:constants
        RH GGP - location 
    )

    (:predicates
        (at ?l - location)
        (john-ready) 
        (meeting-started)
        (min-meeting-duration-met)
        (optimal-meeting-duration-met)
    )
    
    (:functions 
    ) ; Using implicit total-cost for time tracking (T)

    ; 1. Travel Russian Hill (RH) to Golden Gate Park (GGP). Duration: 21 minutes.
    ; T: 540 -> 561
    (:action travel_RH_GGP
        :parameters ()
        :precondition (at RH)
        :effect (and
            (not (at RH))
            (at GGP)
            (increase (total-cost) 21)
        )
    )

    ; 2. Wait until John is available (780 minutes). T: 561 -> 780. Wait duration: 219 minutes.
    (:action wait_for_john
        :parameters ()
        :precondition (and 
            (at GGP) 
            (not (john-ready))
        )
        :effect (and
            (john-ready)
            (increase (total-cost) 219)
        )
    )
    
    ; 3. Meet John for Optimal 315 minutes (780 to 1095).
    (:action meet_john_D315
        :parameters ()
        :precondition (and 
            (at GGP) 
            (john-ready)
            (not (meeting-started))
        )
        :effect (and
            (meeting-started)
            (min-meeting-duration-met) ; Satisfies the >= 90 min requirement
            (optimal-meeting-duration-met) ; Achieves maximization goal
            (increase (total-cost) 315)
        )
    )
    
    ; Note: Actions for shorter, non-optimal durations (like D90) are omitted 
    ; because the metric requires achieving the explicitly optimal outcome via (optimal-meeting-duration-met).

    ; 4. Travel back GGP to RH. Duration: 19 minutes.
    (:action leave_GGP_for_RH
        :parameters ()
        :precondition (and
            (at GGP)
            (min-meeting-duration-met) 
        )
        :effect (and
            (not (at GGP))
            (at RH)
            (increase (total-cost) 19)
        )
    )
)