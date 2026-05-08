(define (domain meeting-planning-temporal)
    (:requirements :durative-actions :typing :negative-preconditions :action-costs)
    (:types
        location
    )
    (:predicates
        (at ?l - location)
        (met-minimum-duration)
    )
    (:functions
        (current-time) ; Minutes from midnight (Start 540, David Available 960-1305)
        (meeting-duration)
        (total-cost) ; Fluent to track and maximize meeting time
        (travel-duration ?l1 - location ?l2 - location)
    )

    ;; Action: Travel
    (define (durative-action travel)
        :parameters (?l_from - location ?l_to - location)
        :duration (= ?duration (travel-duration ?l_from ?l_to))
        :condition
            (and
                (at start (at ?l_from))
                (over all (not (at ?l_to))) ; Ensure transition integrity
            )
        :effect
            (and
                (at start (not (at ?l_from)))
                (at end (at ?l_to))
                (at end (increase (current-time) ?duration))
            )
    )

    ;; Action: Wait (Used to align time until 16:00 (960))
    (define (durative-action wait)
        :parameters (?l - location)
        :duration (?d)
        :condition
            (and
                (at start (at ?l))
                (over all (>= ?d 1)) ; Ensure positive duration if required by planner
            )
        :effect
            (at end (increase (current-time) ?d))
    )

    ;; Action: Meet David (Only possible at Chinatown)
    ;; Constraints: Start >= 960, End <= 1305. Duration must be positive.
    (define (durative-action meet_david)
        :parameters ()
        :duration (?d)
        :condition
            (and
                (at start (at Chinatown))
                (over all (>= ?d 1))
                ; Availability Start Check (16:00 = 960 min)
                (at start (>= (current-time) 960))
                ; Availability End Check (21:45 = 1305 min)
                (at end (<= (current-time) 1305))
            )
        :effect
            (and
                (at end (increase (current-time) ?d))
                (at end (increase (meeting-duration) ?d))
                ; Requirement: 105 minutes minimum
                (at end (when (>= (meeting-duration) 105) (met-minimum-duration)))
                ; Optimization Metric: Maximize meeting time
                (increase (total-cost) ?d)
            )
    )
)