(define (domain meeting-scheduler)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
    )
    (:predicates
        (at ?l - location)
        (arrived-presidio-early) ; Agent arrived at Presidio before Matthew is available (T=17 < T=120)
        (matthew-available)      ; Matthew is ready to meet (T >= 120)
        (meeting-started)
        (met-matthew)
    )

    (:functions
        (total-time) ; Tracks elapsed time in minutes from 9:00 AM (T=0)
    )

    ;; Action 1: Travel from Nob Hill to Presidio (17 minutes)
    (:action travel-nh-to-presidio
        :parameters ()
        :precondition (at nob-hill)
        :effect (and
            (not (at nob-hill))
            (at presidio)
            (increase (total-time) 17) ; Travel time 17 minutes
            (arrived-presidio-early)
        )
    )

    ;; Action 2: Wait the necessary time (103 minutes) to reach Matthew's start availability (T=120)
    ;; This action transitions the state based on reaching the 120 minute milestone.
    (:action wait-for-matthew-availability
        :parameters ()
        :precondition (and 
            (at presidio) 
            (arrived-presidio-early) 
            (not (matthew-available))
        )
        :effect (and
            (increase (total-time) 103) ; 120 - 17 = 103 minutes wait
            (matthew-available) ; T=120 reached
            (not (arrived-presidio-early))
        )
    )

    ;; Action 3: Start the meeting
    (:action start-meeting-matthew
        :parameters ()
        :precondition (and
            (at presidio)
            (matthew-available)
            (not (meeting-started))
        )
        :effect (meeting-started)
    )
    
    ;; Action 4: Complete the meeting (30 minutes minimum duration enforced exactly)
    (:action complete-meeting-matthew
        :parameters ()
        :precondition (meeting-started)
        :effect (and
            (increase (total-time) 30) ; Meeting duration
            (met-matthew)
            (not (meeting-started))
        )
    )
    
    ;; Optional Action: Travel from Presidio to Nob Hill (18 minutes)
    (:action travel-presidio-to-nh
        :parameters ()
        :precondition (at presidio)
        :effect (and
            (not (at presidio))
            (at nob-hill)
            (increase (total-time) 18) 
        )
    )
)