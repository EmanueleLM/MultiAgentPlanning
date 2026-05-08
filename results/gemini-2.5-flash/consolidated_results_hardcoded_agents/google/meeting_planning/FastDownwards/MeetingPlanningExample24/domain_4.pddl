(define (domain meeting-scheduler)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
    )
    (:predicates
        (at ?l - location)
        (arrived-presidio) ; Arrived at T=17
        (time-to-meet)     ; Matthew available, T >= 120
        (meeting-started)
        (met-matthew)
    )

    ;; 1. Travel Nob Hill to Presidio (17 minutes)
    (:action travel-nh-to-presidio
        :parameters ()
        :precondition (at nob-hill)
        :effect (and
            (not (at nob-hill))
            (at presidio)
            (arrived-presidio)
        )
    )

    ;; 2. Wait 103 minutes until 11:00 AM (T=120)
    (:action wait-until-matthew-available
        :parameters ()
        :precondition (and 
            (at presidio) 
            (arrived-presidio) 
            (not (time-to-meet))
        )
        :effect (time-to-meet)
    )

    ;; 3. Start meeting (Instantaneous at T=120)
    (:action start-meeting-matthew
        :parameters ()
        :precondition (and
            (at presidio)
            (time-to-meet)
            (not (meeting-started))
        )
        :effect (meeting-started)
    )
    
    ;; 4. Complete meeting (Minimum 30 minutes duration, ends T>=150)
    (:action complete-meeting-matthew
        :parameters ()
        :precondition (meeting-started)
        :effect (and
            (met-matthew)
            (not (meeting-started))
        )
    )
    
    ;; Optional: Travel back (18 minutes)
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
)