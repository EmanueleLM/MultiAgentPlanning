(define (domain meeting-scheduler)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
    )
    (:predicates
        (at ?l - location)
        (traveled-to-presidio) ; T=17 reached
        (matthew-available)      ; T=120 reached (ready to meet)
        (meeting-started)
        (met-matthew)
    )

    ;; Action 1: Travel from Nob Hill to Presidio (17 minutes)
    ;; State after this action corresponds to T=17
    (:action travel-nh-to-presidio
        :parameters ()
        :precondition (at nob-hill)
        :effect (and
            (not (at nob-hill))
            (at presidio)
            (traveled-to-presidio)
        )
    )

    ;; Action 2: Wait the necessary time (103 minutes) until Matthew's availability (T=120)
    ;; State after this action corresponds to T=120
    (:action wait-for-matthew-availability
        :parameters ()
        :precondition (and 
            (at presidio) 
            (traveled-to-presidio) 
            (not (matthew-available))
        )
        :effect (matthew-available)
    )

    ;; Action 3: Start the meeting (Instantaneous at T=120)
    (:action start-meeting-matthew
        :parameters ()
        :precondition (and
            (at presidio)
            (matthew-available)
            (not (meeting-started))
        )
        :effect (meeting-started)
    )
    
    ;; Action 4: Complete the meeting (30 minutes minimum duration enforced)
    ;; State after this action corresponds to T=150 (Well before Matthew leaves at T=255)
    (:action complete-meeting-matthew
        :parameters ()
        :precondition (meeting-started)
        :effect (and
            (met-matthew)
            (not (meeting-started))
        )
    )
    
    ;; Optional Action: Travel from Presidio to Nob Hill (18 minutes)
    ;; State after this action corresponds to T=168
    (:action travel-presidio-to-nh
        :parameters ()
        :precondition (at presidio)
        :effect (and
            (not (at presidio))
            (at nob-hill)
        )
    )
)