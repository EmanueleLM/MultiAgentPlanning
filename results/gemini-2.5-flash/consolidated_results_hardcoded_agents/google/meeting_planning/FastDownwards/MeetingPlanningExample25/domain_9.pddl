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
        (t-540)
        (t-563)
        (t-960)
        (t-1305)
        (t-1328)
    )

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
)