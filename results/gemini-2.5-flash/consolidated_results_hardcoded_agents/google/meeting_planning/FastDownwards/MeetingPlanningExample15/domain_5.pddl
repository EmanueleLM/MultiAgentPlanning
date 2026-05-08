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
    )
    
    (:functions 
        (total-cost) ; Tracks time (minutes from midnight)
        (negated-duration) ; Minimize this to maximize meeting duration
    )

    ; 1. Travel Russian Hill (RH) to Golden Gate Park (GGP). Duration: 21 minutes.
    ; Start time 540 + 21 = 561
    (:action travel_RH_GGP
        :parameters ()
        :precondition (at RH)
        :effect (and
            (not (at RH))
            (at GGP)
            (increase (total-cost) 21)
        )
    )

    ; 2. Wait until John is available (780 minutes). Duration: 219 minutes (561 -> 780).
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
    
    ; 3a. Meet John for Minimum 90 minutes. Total time 780 + 90 = 870.
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
            (decrease (negated-duration) 90)
        )
    )
    
    ; 3b. Meet John for Optimal 315 minutes (780 to 1095).
    (:action meet_john_D315
        :parameters ()
        :precondition (and 
            (at GGP) 
            (john-ready)
            (not (meeting-started))
        )
        :effect (and
            (meeting-started)
            (min-meeting-duration-met)
            (increase (total-cost) 315)
            (decrease (negated-duration) 315)
        )
    )
    
    ; 4. Travel back GGP to RH. Duration: 19 minutes. Optional travel.
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