(define (domain meeting-scheduler)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
        time ; Represents discrete time stages relative to 9:00 AM (T0)
    )
    (:predicates
        (at ?l - location)
        (time-stage ?t - time) ; Indicates the current time stage reached
        (meeting-completed) ; Goal predicate
    )

    ;; --- Time Milestones (relative minutes from 9:00 AM) ---
    ;; T0 = 0 min (9:00 AM) - Start
    ;; T17 = 17 min (9:17 AM) - Arrival at Presidio
    ;; T120 = 120 min (11:00 AM) - Matthew available start
    ;; T150 = 150 min (11:30 AM) - Earliest meeting end (30 min minimum duration)

    ;; 1. Travel from Nob Hill to Presidio (Duration: 17 minutes) [T0 -> T17]
    (:action travel-nh-to-presidio
        :parameters ()
        :precondition (and 
            (at nob-hill)
            (time-stage T0)
        )
        :effect (and
            (not (at nob-hill))
            (at presidio)
            (not (time-stage T0))
            (time-stage T17)
        )
    )

    ;; 2. Wait at Presidio until Matthew is available (Duration: 103 minutes) [T17 -> T120]
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

    ;; 3. Meet Matthew (Minimum Duration: 30 min). Requires being at Presidio when Matthew is available (T120)
    ;; This action transitions time to T150 (11:30 AM), satisfying the 30-minute minimum duration requirement.
    (:action meet-matthew
        :parameters ()
        :precondition (and
            (at presidio)
            (time-stage T120)
            (not (meeting-completed))
        )
        :effect (and
            (not (time-stage T120))
            (time-stage T150) ; Meeting ends at 11:30 AM, which is before 3:15 PM (T255)
            (meeting-completed)
        )
    )
)