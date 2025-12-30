(define (domain meeting-planning-classical)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
    )
    (:constants
        GGP - location
        chinatown - location
    )
    (:predicates
        (at ?l - location)
        (met-minimum-duration)
        ; Time state predicates (minutes from midnight)
        (t-540)  ; 9:00 AM Start
        (t-563)  ; 9:23 AM Arrived at Chinatown (540 + 23)
        (t-960)  ; 4:00 PM David Available
        (t-1305) ; 9:45 PM David Unavailable (End time)
        (t-1328) ; 10:08 PM (End time if returning)
    )

    ;; Action 1: Travel from GGP to Chinatown (Duration 23 min)
    ;; T=540 -> T=563
    (:action travel_GGP_chinatown
        :parameters ()
        :precondition 
            (and 
                (at GGP)
                (t-540)
            )
        :effect
            (and
                (not (at GGP))
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
    ;; Duration: 345 minutes. Satisfies 105 min minimum requirement.
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
            )
    )
    
    ;; Action 4 (Optional cleanup/termination step): Travel back to GGP 
    ;; T=1305 -> T=1328
    (:action travel_chinatown_GGP
        :parameters ()
        :precondition 
            (and
                (at chinatown)
                (t-1305)
            )
        :effect
            (and
                (not (at chinatown))
                (at GGP)
                (not (t-1305))
                (t-1328)
            )
    )