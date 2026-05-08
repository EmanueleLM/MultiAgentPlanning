(define (domain meeting-schedule)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types location - object)

    (:predicates
        (at ?l - location)
        (john-ready)
        (meeting-complete)
        (traveled-to-ggp)
    )
    
    ; Time is tracked via (total-cost), starting at 540 minutes (9:00 AM).

    ; 1. Travel Russian Hill (RH) to Golden Gate Park (GGP). Duration: 21 minutes.
    ; T_start = 540. T_end = 561.
    (:action travel_RH_GGP
        :parameters ()
        :precondition (at RH)
        :effect (and
            (not (at RH))
            (at GGP)
            (traveled-to-ggp)
            (increase (total-cost) 21)
        )
    )

    ; 2. Wait until John is available at 780 minutes (1:00 PM).
    ; We arrive at 561. Wait duration: 780 - 561 = 219 minutes.
    ; T_start = 561. T_end = 780.
    (:action wait_until_john_available
        :parameters ()
        :precondition (and 
            (at GGP) 
            (traveled-to-ggp) 
            (not (john-ready))
        )
        :effect (and
            (john-ready)
            (increase (total-cost) 219)
        )
    )
    
    ; 3. Meet John for the maximum feasible duration D=315 minutes (780 to 1095).
    ; This satisfies the minimum 90 minutes requirement and maximizes the objective.
    ; T_start = 780. T_end = 1095.
    (:action meet_john_optimal_D315
        :parameters ()
        :precondition (and 
            (at GGP) 
            (john-ready)
            (not (meeting-complete))
        )
        :effect (and
            (meeting-complete)
            (increase (total-cost) 315)
        )
    )
    
    ; 4. Travel back GGP to RH. Duration: 19 minutes.
    ; T_start = 1095. T_end = 1114.
    (:action leave_GGP_for_RH
        :parameters ()
        :precondition (and
            (at GGP)
            (meeting-complete)
        )
        :effect (and
            (not (at GGP))
            (at RH)
            (increase (total-cost) 19)
        )
    )