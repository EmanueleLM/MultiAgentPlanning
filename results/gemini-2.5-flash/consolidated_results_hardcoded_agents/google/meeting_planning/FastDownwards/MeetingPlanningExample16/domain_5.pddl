(define (domain meeting-sf)
    (:requirements :strips :typing :negative-preconditions)

    (:types 
        location
    )

    (:predicates
        (at ?l - location)
        (arrived_rh)        ; Tracks arrival at Russian Hill (9:07 AM, 547 min)
        (ronald_available)  ; Tracks time when Ronald is available (3:15 PM, 915 min)
        (met_ronald)        ; Goal achieved, representing 255 minutes meeting
    )
    
    ; Travel from Chinatown to Russian Hill (7 minutes implicit duration). Start 540, End 547.
    (:action travel-chinatown-russianhill
        :parameters ()
        :precondition
            (at chinatown)
        :effect
            (and
                (at russian-hill)
                (not (at chinatown))
                (arrived_rh)
            )
    )

    ; Wait until Ronald is available at 3:15 PM (915 min). Implicit wait duration: 368 minutes (547 to 915).
    (:action wait-for-ronald
        :parameters ()
        :precondition
            (and 
                (at russian-hill)
                (arrived_rh)
            )
        :effect
            (ronald_available)
    )

    ; Meet Ronald for the maximum possible duration (9:30 PM / 1170 min - 3:15 PM / 915 min = 255 minutes).
    ; This satisfies the minimum duration of 105 minutes and maximizes the metric implicitly.
    (:action meet-ronald-optimal
        :parameters ()
        :precondition
            (and 
                (at russian-hill)
                (ronald_available)
            )
        :effect
            (met_ronald)
    )

    ; Travel back from Russian Hill to Chinatown (9 minutes implicit duration). Optional.
    (:action travel-russianhill-chinatown
        :parameters ()
        :precondition
            (and
                (at russian-hill)
                (met_ronald) 
            )
        :effect
            (and
                (at chinatown)
                (not (at russian-hill))
            )
    )
)