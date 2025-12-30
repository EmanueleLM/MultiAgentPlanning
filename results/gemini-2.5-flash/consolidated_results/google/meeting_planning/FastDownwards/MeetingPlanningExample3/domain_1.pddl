(define (domain MeetingPlanning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
        time-point
    )
    (:predicates
        (at ?l - location) ; Traveler location
        (available-at ?l - location) ; Barbara location/availability
        (current-time ?t - time-point) ; Tracks current state time marker
        (met-barbara)
    )

    ;; Action 1: Travel Bayview (B) to Golden Gate Park (GGP)
    ;; Duration: 22 minutes. Transitions T_900 (9:00) -> T_922 (9:22).
    (:action travel-bayview-to-ggp
        :parameters ()
        :precondition (and
            (at bayview)
            (current-time T_900)
        )
        :effect (and
            (not (at bayview))
            (at ggp)
            (not (current-time T_900))
            (current-time T_922)
        )
    )
    
    ;; Action 2A: Start meeting immediately upon arrival (9:22 AM).
    ;; Duration: 90 minutes. Ends at T_1052 (10:52 AM). Feasible.
    (:action meet-start-922
        :parameters ()
        :precondition (and
            (at ggp)
            (current-time T_922)
            (available-at ggp)
        )
        :effect (and
            (not (current-time T_922))
            (current-time T_1052)
            (met-barbara)
        )
    )

    ;; Action 2B (Wait): Wait 8 minutes to reach the latest feasible start time.
    ;; Transitions T_922 (9:22) -> T_1000 (10:00).
    (:action wait-to-1000
        :parameters ()
        :precondition (and
            (at ggp)
            (current-time T_922)
        )
        :effect (and
            (not (current-time T_922))
            (current-time T_1000)
        )
    )

    ;; Action 2C (Meet Late): Start meeting at 10:00 AM.
    ;; Duration: 90 minutes. Ends exactly at T_1130 (11:30 AM). Feasible.
    (:action meet-start-1000
        :parameters ()
        :precondition (and
            (at ggp)
            (current-time T_1000)
            (available-at ggp)
        )
        :effect (and
            (not (current-time T_1000))
            (current-time T_1130)
            (met-barbara)
        )
    )
)