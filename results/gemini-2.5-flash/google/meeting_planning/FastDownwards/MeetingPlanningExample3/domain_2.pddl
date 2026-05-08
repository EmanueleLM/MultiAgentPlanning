(define (domain meeting-planning)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types location)
    (:predicates
        (at ?p - location)
        (met_barbara)
        (can-start-meeting-window) ; True when traveler is at GGP within the 9:22 AM - 10:00 AM start window
    )

    (:action travel-bayview-to-golden-gate-park)
        :parameters ()
        :precondition
            (and
                (at bayview)
            )
        :effect
            (and
                (not (at bayview))
                (at golden-gate-park)
                (can-start-meeting-window) ; Traveler arrives at GGP at 9:22 AM (9:00 AM + 22 min travel),
                                            ; which is within Barbara's 8:00 AM - 11:30 AM availability
                                            ; and allows a 90-min meeting to end by 11:30 AM (meeting starts latest 10:00 AM).
                (increase (total-cost) 22)
            )

    (:action travel-golden-gate-park-to-bayview)
        :parameters ()
        :precondition
            (and
                (at golden-gate-park)
            )
        :effect
            (and
                (not (at golden-gate-park))
                (at bayview)
                (increase (total-cost) 23)
            )

    (:action meet-barbara-at-ggp)
        :parameters ()
        :precondition
            (and
                (at golden-gate-park)
                (not (met_barbara))
                (can-start-meeting-window) ; Ensures traveler is at GGP and it's within the valid 9:22 AM - 10:00 AM start time window
            )
        :effect
            (and
                (met_barbara)
                (not (can-start-meeting-window)) ; The meeting window is used once the meeting starts
            )
)