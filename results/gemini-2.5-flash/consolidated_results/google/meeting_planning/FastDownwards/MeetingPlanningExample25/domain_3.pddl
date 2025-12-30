(define (domain meeting-planning-classical)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
    )
    (:predicates
        (at ?l - location)
        (met-minimum-duration)
        ; Time state predicates replacing time fluents
        (time-state-540)  ; 9:00 AM Start
        (time-state-563)  ; 9:23 AM Arrived at Chinatown (540 + 23)
        (time-state-960)  ; 4:00 PM David Available
        (time-state-1305) ; 9:45 PM David Unavailable
    )
    (:functions
        (total-cost) ; Metric tracking benefit (meeting duration)
    )

    ;; Action 1: Travel from GGP to Chinatown (Duration 23 min)
    ;; T=540 -> T=563
    (:action travel_GGP_Chinatown
        :parameters ()
        :precondition 
            (and 
                (at GGP)
                (time-state-540)
            )
        :effect
            (and
                (not (at GGP))
                (at Chinatown)
                (not (time-state-540))
                (time-state-563)
            )
    )

    ;; Action 2: Wait until David becomes available (563 min -> 960 min)
    (:action wait_for_availability
        :parameters ()
        :precondition
            (and
                (at Chinatown)
                (time-state-563)
            )
        :effect
            (and
                (not (time-state-563))
                (time-state-960)
            )
    )

    ;; Action 3: Meet David for the maximum possible duration (960 min -> 1305 min)
    ;; Duration: 345 minutes (Maximizes time, satisfies 105 min minimum requirement).
    (:action meet_david_max_345
        :parameters ()
        :precondition
            (and
                (at Chinatown)
                (time-state-960)
            )
        :effect
            (and
                (not (time-state-960))
                (time-state-1305)
                (met-minimum-duration)
                (increase (total-cost) 345) 
            )
    )
    
    ;; Action 4: Travel back to GGP (Duration 23 min)
    ;; T=1305 -> T=1328
    (:action travel_Chinatown_GGP
        :parameters ()
        :precondition 
            (and
                (at Chinatown)
                (time-state-1305)
            )
        :effect
            (and
                (not (at Chinatown))
                (at GGP)
            )
    )
)