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
        (total-time) ; Tracks time (minutes from midnight)
        (meeting-duration) ; Maximize this fluent
    )

    ; 1. Travel Russian Hill (RH) to Golden Gate Park (GGP). Duration: 21 minutes.
    ; Starts at 540, ends at 561.
    (:action travel_RH_GGP
        :parameters ()
        :precondition (at RH)
        :effect (and
            (not (at RH))
            (at GGP)
            (increase (total-time) 21)
        )
    )

    ; 2. Wait until John is available (780 minutes). Arrive 561. Wait duration: 780 - 561 = 219 minutes.
    (:action wait_for_john
        :parameters ()
        :precondition (and 
            (at GGP) 
            (not (john-ready))
        )
        :effect (and
            (john-ready)
            (increase (total-time) 219)
        )
    )
    
    ; 3a. Meet John for Minimum 90 minutes. Starts 780, Ends 870.
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
            (increase (total-time) 90)
            (increase (meeting-duration) 90)
        )
    )
    
    ; 3b. Meet John for Optimal 315 minutes (780 to 1095). Ends 1095.
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
            (increase (total-time) 315)
            (increase (meeting-duration) 315)
        )
    )
    
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
            (increase (total-time) 19)
        )
    )
)