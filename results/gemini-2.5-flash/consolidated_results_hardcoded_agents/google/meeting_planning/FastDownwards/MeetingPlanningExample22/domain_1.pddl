(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :durative-actions :fluents :action-costs)
    (:types
        location
        agent
        friend
    )

    (:predicates
        (is-at ?a - agent ?l - location)
        (met ?f - friend)
    )

    (:fluents
        (current-time) ; Minutes past midnight
        (total-meetings) ; Counter for goal optimization
    )

    (:durative-action travel-presidio-to-unionsquare
        :parameters (?a - agent)
        :duration (= ?duration 22)
        :condition
            (and
                (at start (is-at ?a presidio))
            )
        :effect
            (and
                (at start (not (is-at ?a presidio)))
                (at end (is-at ?a unionsquare))
                (at end (increase (current-time) 22))
            )
    )

    (:durative-action travel-unionsquare-to-presidio
        :parameters (?a - agent)
        :duration (= ?duration 24)
        :condition
            (and
                (at start (is-at ?a unionsquare))
            )
        :effect
            (and
                (at start (not (is-at ?a unionsquare)))
                (at end (is-at ?a presidio))
                (at end (increase (current-time) 24))
            )
    )

    ; Andrew Availability: 11:15 AM (675 min) to 5:15 PM (1035 min)
    ; Required Duration: 105 min. Max Start Time: 930 min.

    (:durative-action meet-andrew
        :parameters (?a - agent ?f - friend ?l - location)
        :duration (= ?duration 105) 
        :condition
            (and
                ; Positional requirement
                (at start (is-at ?a ?l))
                (= ?l unionsquare)
                (= ?f andrew)
                (not (met ?f))

                ; Temporal Window Constraints
                ; Start time must be >= 675 (11:15 AM)
                (at start (>= (current-time) 675))
                
                ; Start time must be <= 930 (3:30 PM) so end time (Start + 105) <= 1035 (5:15 PM)
                (at start (<= (current-time) 930))
            )
        :effect
            (and
                (at end (met ?f))
                (at end (increase (current-time) 105))
                (at end (increase (total-meetings) 1))
            )
    )
)