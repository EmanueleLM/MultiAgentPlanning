(define (domain meeting-planning-classical)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        location
    )
    (:predicates
        (at ?l - location)
        (met-minimum-duration)
    )
    (:functions
        (current-time) ; Minutes from midnight (9:00 AM = 540, 4:00 PM = 960, 9:45 PM = 1305)
        (meeting-duration)
        (total-cost) ; Metric to maximize meeting time
    )

    ;; Action 1: Travel from GGP to Chinatown (Duration 23 min)
    (define (action travel_GGP_Chinatown)
        :parameters ()
        :precondition (at GGP)
        :effect
            (and
                (not (at GGP))
                (at Chinatown)
                (increase (current-time) 23)
            )
    )

    ;; Action 2: Wait until David becomes available (16:00 / 960 min)
    ;; Agent arrives at 563 (540 + 23). Must wait until 960.
    (define (action wait_for_availability)
        :parameters ()
        :precondition
            (and
                (at Chinatown)
                (< (current-time) 960)
            )
        :effect
            (and
                (assign (current-time) 960)
            )
    )

    ;; Action 3: Meet David for the minimum required duration (105 minutes)
    ;; Must start exactly at 960 (after wait).
    (define (action meet_david_min_105)
        :parameters ()
        :precondition
            (and
                (at Chinatown)
                (= (current-time) 960)
                (not (met-minimum-duration))
            )
        :effect
            (and
                (increase (current-time) 105)
                (increase (meeting-duration) 105)
                (met-minimum-duration)
                (increase (total-cost) 105) ; Cost tracking
            )
    )

    ;; Action 4: Meet David for an extra 1 minute chunk, maximizing time until 1305.
    (define (action meet_david_extra_1min)
        :parameters ()
        :precondition
            (and
                (at Chinatown)
                (met-minimum-duration)
                (< (current-time) 1305) ; Must allow time for 1 minute increase
            )
        :effect
            (and
                (increase (current-time) 1)
                (increase (meeting-duration) 1)
                (increase (total-cost) 1)
            )
    )
    
    ;; Action 5: Travel back to GGP (Duration 23 min)
    (define (action travel_Chinatown_GGP)
        :parameters ()
        :precondition 
            (at Chinatown)
        :effect
            (and
                (not (at Chinatown))
                (at GGP)
                (increase (current-time) 23)
            )
    )
)