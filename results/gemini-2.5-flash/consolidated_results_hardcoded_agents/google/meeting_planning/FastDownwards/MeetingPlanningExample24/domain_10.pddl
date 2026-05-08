(define (domain meeting-scheduler)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
        time
    )
    (:predicates
        (at ?l - location)
        (time-stage ?t - time)
        (meeting-completed)
    )

    ;; Action 1: Travel Nob Hill to Presidio (Duration: 17 minutes) [T0 -> T17]
    (:action travel-nh-to-presidio
        :parameters ()
        :precondition (and 
            (at nobhill)
            (time-stage T0)
        )
        :effect (and
            (not (at nobhill))
            (at presidio)
            (not (time-stage T0))
            (time-stage T17)
        )
    )

    ;; Action 2: Wait at Presidio until Matthew is available (Duration: 103 minutes) [T17 -> T120]
    (:action wait-for-availability
        :parameters ()
        :precondition (and
            (at presidio)
            (time-stage T17)
        )
        :effect (and
            (not (time-stage T17))
            (time-stage T120) ; 11:00 AM
        )
    )

    ;; Action 3: Meet Matthew (Duration: 30 min minimum) [T120 -> T150]
    (:action meet-matthew
        :parameters ()
        :precondition (and
            (at presidio)
            (time-stage T120)
            (not (meeting-completed))
        )
        :effect (and
            (not (time-stage T120))
            (time-stage T150) ; Meeting ends at 11:30 AM, valid since Matthew is available until T255
            (meeting-completed)
        )
    )
)