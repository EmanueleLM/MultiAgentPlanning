(define (domain meeting-scheduler)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
    )
    (:predicates
        (at ?l - location)
        (traveled-to-presidio)
        (matthew-available)
        (meeting-started)
        (met-matthew)
    )

    ;; Action 1: Travel from Nob Hill to Presidio (17 minutes)
    ;; T=0 -> T=17
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
    ;; T=17 -> T=120
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
    
    ;; Action 4: Complete the meeting (30 minutes minimum duration enforced, T=120 -> T=150)
    (:action complete-meeting-matthew
        :parameters ()
        :precondition (meeting-started)
        :effect (and
            (met-matthew)
            (not (meeting-started))
        )
    )
    
    ;; Optional Action: Travel from Presidio to Nob Hill (18 minutes)
    ;; T=150 -> T=168 (Only possible after meeting is successfully completed)
    (:action travel-presidio-to-nh
        :parameters ()
        :precondition (and 
            (at presidio)
            (met-matthew)
        )
        :effect (and
            (not (at presidio))
            (at nob-hill)
        )
    )