(define (domain meeting-planning-classical)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
    )
    (:predicates
        (at ?l - location)
        (met-minimum-duration)
        ; Time state predicates (minutes from midnight)
        (t-540)  ; 9:00 AM Start
        (t-563)  ; 9:23 AM Arrived at Chinatown
        (t-960)  ; 4:00 PM David Available
        (t-1305) ; 9:45 PM David Unavailable (End time)
    )
    (:functions
        (total-cost) ; Metric tracking benefit (meeting duration)
    )

    ;; Action 1: Travel from GGP to Chinatown (Duration 23 min)
    ;; T=540 -> T=563
    (:action travel_ggp_chinatown
        :parameters ()
        :precondition 
            (and 
                (at ggp)
                (t-540)
            )
        :effect
            (and
                (not (at ggp))
                (at chinatown)
                (not (t-540))
                (t-563)
            )
    )

    ;; Action 2: Wait until David becomes available (563 min -> 960 min)
    (:action wait_for_availability
        :parameters ()
        :precondition
            (and
                (at chinatown)
                (t-563)
            )
        :effect
            (and
                (not (t-563))
                (t-960)
            )
    )

    ;; Action 3: Meet David for the maximum possible duration (960 min -> 1305 min)
    ;; Duration: 345 minutes. This action enforces the minimum duration goal.
    (:action meet_david_max
        :parameters ()
        :precondition
            (and
                (at chinatown)
                (t-960)
            )
        :effect
            (and
                (not (t-960))
                (t-1305)
                (met-minimum-duration) 
                (increase (total-cost) 345) 
            )
    )
    
    ;; Action 4 (Optional cleanup/termination step): Travel back to GGP 
    ;; T=1305 -> T=1328
    (:action travel_chinatown_ggp
        :parameters ()
        :precondition 
            (and
                (at chinatown)
                (t-1305)
            )
        :effect
            (and
                (not (at chinatown))
                (at ggp)
            )
    )
)