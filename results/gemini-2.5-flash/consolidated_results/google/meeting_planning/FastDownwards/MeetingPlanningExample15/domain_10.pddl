(define (domain meeting-schedule)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types location - object)

    (:constants
        RH GGP - location 
    )

    (:predicates
        (at ?l - location)
        (john-ready) 
        (meeting-started) ; Indicates time duration has passed (meeting completed)
        (min-meeting-duration-met) ; True if >= 90 min met
        (optimal-meeting-duration-met) ; True if 315 min met
    )
    
    (:functions 
        (total-cost)
    ) 

    ; 1. Travel Russian Hill (RH) to Golden Gate Park (GGP). Duration: 21 minutes.
    (:action travel_RH_GGP
        :parameters ()
        :precondition (at RH)
        :effect (and
            (not (at RH))
            (at GGP)
            (increase (total-cost) 21)
        )
    )

    ; 2. Wait until John is available (780 minutes). Duration: 219 minutes.
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
    
    ; 3A. Meet John for Minimum 90 minutes. (T=780 -> T=870)
    (:action meet_john_D90
        :parameters ()
        :precondition (and 
            (at GGP) 
            (john-ready)
            (not (meeting-started))
        )
        :effect (and
            (meeting-started)
            (min-meeting-duration-met)
            (increase (total-cost) 90)
        )
    )

    ; 3B. Meet John for Optimal 315 minutes. (T=780 -> T=1095)
    (:action meet_john_D315
        :parameters ()
        :precondition (and 
            (at GGP) 
            (john-ready)
            (not (meeting-started))
        )
        :effect (and
            (meeting-started)
            (min-meeting-duration-met) ; Also satisfies minimum requirement
            (optimal-meeting-duration-met) ; Achieves maximization goal
            (increase (total-cost) 315)
        )
    )
    
    ; 4. Travel back GGP to RH. Duration: 19 minutes.
    (:action leave_GGP_for_RH
        :parameters ()
        :precondition (and
            (at GGP)
            (meeting-started) 
            (min-meeting-duration-met) ; Ensures minimum duration constraint was met
        )
        :effect (and
            (not (at GGP))
            (at RH)
            (increase (total-cost) 19)
        )
    )