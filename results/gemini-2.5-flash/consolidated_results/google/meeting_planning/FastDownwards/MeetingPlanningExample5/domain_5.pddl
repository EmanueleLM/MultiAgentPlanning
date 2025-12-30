(define (domain meeting-scheduler)
    (:requirements :strips :typing :negative-preconditions :fluents :action-costs)
    (:types
        location
        stage
    )
    (:constants
        nh - location ; Nob Hill
        tc - location ; The Castro
        S0 S1 S2 S3 S4 - stage ; S0=9:00, S1=9:17, S2=12:15, S3=1:30 (Min Meet End), S4=10:00 (Deadline)
    )
    (:predicates
        (at ?l - location)
        (current-stage ?s - stage)
        (meeting-in-progress)
    )
    (:functions
        (total-time)
        (meeting-duration)
        (metric-to-minimize) ; Negative of meeting duration. Minimize this to maximize meeting duration.
    )

    ; 1. Travel NH to TC (S0 -> S1). Duration: 17 min. T=0 -> T=17
    (:action travel-nh-to-tc
        :parameters ()
        :precondition (and 
            (current-stage S0)
            (at nh)
        )
        :effect (and
            (not (current-stage S0))
            (current-stage S1)
            (not (at nh))
            (at tc)
            (increase (total-time) 17)
        )
    )

    ; 2. Wait for William (S1 -> S2). Duration: 178 min. T=17 -> T=195 (12:15 PM)
    (:action wait-for-william
        :parameters ()
        :precondition (and
            (current-stage S1)
            (at tc)
        )
        :effect (and
            (not (current-stage S1))
            (current-stage S2)
            (increase (total-time) 178) 
        )
    )

    ; 3. Start Meeting Phase (S2). Instantaneous transition.
    (:action start-meeting-phase
        :parameters ()
        :precondition (and
            (current-stage S2)
            (at tc)
            (not (meeting-in-progress))
        )
        :effect (and
            (meeting-in-progress)
        )
    )

    ; 4. Meet Minimum Required Duration (S2 -> S3). Duration: 75 min. T=195 -> T=270 (1:30 PM)
    (:action meet-minimum-required
        :parameters ()
        :precondition (and
            (current-stage S2)
            (meeting-in-progress)
            (at tc)
        )
        :effect (and
            (not (current-stage S2))
            (current-stage S3)
            (increase (total-time) 75)
            (increase (meeting-duration) 75)
            (decrease (metric-to-minimize) 75)
        )
    )

    ; 5. Meet Maximum Remaining Duration (S3 -> S4). Duration: 510 min. T=270 -> T=780 (10:00 PM)
    (:action meet-maximize-remaining-duration
        :parameters ()
        :precondition (and
            (current-stage S3)
            (meeting-in-progress)
            (at tc)
        )
        :effect (and
            (not (current-stage S3))
            (current-stage S4) 
            (increase (total-time) 510)
            (increase (meeting-duration) 510)
            (decrease (metric-to-minimize) 510)
        )
    )
    
    ; 6. End meeting after minimum is satisfied (allows stopping meeting state instantaneously at S3 or S4)
    (:action terminate-meeting
        :parameters ()
        :precondition (and
            (at tc)
            (meeting-in-progress)
            (or (current-stage S3) (current-stage S4)) ; Use OR here as the constraint is on the minimum duration (75 min) met via S3. If OR is not supported, this action must be duplicated per stage. Assuming support for OR in preconditions given :negative-preconditions is supported. Let's duplicate to ensure compliance if ADL is rejected.
        )
        :effect (and
            (not (meeting-in-progress))
        )
    )
    
    ; Redefining Termination Actions to avoid OR, relying on structural path chosen:
    
    ; 6a. Terminate meeting after minimum (S3)
    (:action terminate-meeting-at-s3
        :parameters ()
        :precondition (and
            (current-stage S3)
            (meeting-in-progress)
            (at tc)
        )
        :effect (and
            (not (meeting-in-progress))
        )
    )

    ; 6b. Terminate meeting at deadline (S4)
    (:action terminate-meeting-at-s4
        :parameters ()
        :precondition (and
            (current-stage S4)
            (meeting-in-progress)
            (at tc)
        )
        :effect (and
            (not (meeting-in-progress))
        )
    )
    
    ; 7. Travel TC to NH. Duration: 16 min.
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
)