(define (domain meeting-scheduler)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
    )
    (:constants
        nh - location ; Nob Hill
        tc - location ; The Castro
    )
    (:predicates
        (at ?l - location)
        (has-met)
        (william-available)
        (meeting-in-progress)
    )
    (:functions
        (total-time)
        (meeting-duration)
        (optimization-metric)
    )

    ; Travel NH (Nob Hill) to TC (The Castro): 17 minutes
    (:action travel-nh-to-tc
        :parameters ()
        :precondition (and 
            (at nh)
            (not (meeting-in-progress))
        )
        :effect (and
            (not (at nh))
            (at tc)
            (increase (total-time) 17)
        )
    )

    ; Travel TC (The Castro) to NH (Nob Hill): 16 minutes
    (:action travel-tc-to-nh
        :parameters ()
        :precondition (and 
            (at tc)
            (not (meeting-in-progress))
        )
        :effect (and
            (not (at tc))
            (at nh)
            (increase (total-time) 16)
        )
    )

    ; Wait until William becomes available at T=195 (12:15 PM). Wait time: 178 minutes.
    (:action synchronize-to-meeting-start
        :parameters ()
        :precondition (and
            (at tc)
            (not (william-available))
            (not (meeting-in-progress))
        )
        :effect (and
            (increase (total-time) 178) 
            (william-available)
        )
    )

    ; Start the meeting at T=195
    (:action start-meeting
        :parameters ()
        :precondition (and
            (at tc)
            (william-available) 
            (not (meeting-in-progress))
        )
        :effect (and
            (meeting-in-progress)
        )
    )

    ; Meet for the minimum required duration (75 minutes).
    (:action meet-minimum-duration
        :parameters ()
        :precondition (and
            (at tc)
            (meeting-in-progress)
        )
        :effect (and
            (increase (total-time) 75)
            (increase (meeting-duration) 75)
            (decrease (optimization-metric) 75) 
            (has-met) 
        )
    )

    ; Maximize the remaining meeting duration until William's deadline (T=780). Duration: 510 minutes.
    (:action maximize-meeting-duration
        :parameters ()
        :precondition (and
            (at tc)
            (has-met) 
            (meeting-in-progress)
            (william-available)
        )
        :effect (and
            (increase (total-time) 510)
            (increase (meeting-duration) 510)
            (decrease (optimization-metric) 510) 
            (not (meeting-in-progress)) 
            (not (william-available)) 
        )
    )

    ; Allow agent to stop meeting after minimum requirement is met.
    (:action end-meeting-after-minimum
        :parameters ()
        :precondition (and
            (at tc)
            (has-met) 
            (meeting-in-progress)
            (william-available)
        )
        :effect (and
            (not (meeting-in-progress))
        )
    )
)