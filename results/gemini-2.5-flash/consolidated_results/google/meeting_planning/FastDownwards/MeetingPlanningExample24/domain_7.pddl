(define (domain meeting-scheduler)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
    )
    (:predicates
        (at ?l - location)
        (meeting-completed)
        
        ;; Time milestones in minutes from 9:00 AM (T0=0)
        (time-T0)    ; 0 min (9:00 AM)
        (time-T17)   ; 17 min (9:17 AM - Arrival at Presidio)
        (time-T120)  ; 120 min (11:00 AM - Matthew available start)
        (time-T150)  ; 150 min (11:30 AM - Meeting ends after 30 min)
    )

    ;; 1. Travel from Nob Hill to Presidio (Duration: 17 minutes)
    ;; T0 -> T17
    (:action travel-nh-to-presidio
        :parameters ()
        :precondition (and 
            (at nob-hill)
            (time-T0)
        )
        :effect (and
            (not (at nob-hill))
            (at presidio)
            (not (time-T0))
            (time-T17)
        )
    )

    ;; 2. Wait at Presidio until Matthew is available (Duration: 103 minutes)
    ;; T17 -> T120
    (:action wait-at-presidio-for-matthew
        :parameters ()
        :precondition (and
            (at presidio)
            (time-T17)
        )
        :effect (and
            (not (time-T17))
            (time-T120)
        )
    )

    ;; 3. Meet Matthew (Minimum Duration: 30 min). T120 -> T150.
    (:action meet-matthew
        :parameters ()
        :precondition (and
            (at presidio)
            (time-T120)
            (not (meeting-completed))
        )
        :effect (and
            (not (time-T120))
            (time-T150)
            (meeting-completed)
        )
    )