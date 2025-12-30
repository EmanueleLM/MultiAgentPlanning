(define (domain meeting-scheduler)
    (:requirements :strips :typing :fluents :durative-actions :negative-preconditions)
    (:types
        location
    )
    (:predicates
        (at ?l - location)
        (meeting-completed)
    )
    (:fluents
        (current-time) ; Time in minutes, 0 = 9:00 AM
    )

    ;; 1. Travel from Nob Hill to Presidio (Duration: 17 minutes)
    (:durative-action travel-nh-to-presidio
        :parameters ()
        :duration (= ?duration 17)
        :condition (at start (at nob-hill))
        :effect (and
            (at end (not (at nob-hill)))
            (at end (at presidio))
            (at end (increase (current-time) 17))
        )
    )

    ;; 2. Wait at Presidio until Matthew is available (T=120). 
    ;; This allows flexible waiting time between arrival (T=17) and 120.
    (:durative-action wait-at-presidio
        :parameters ()
        :duration (and
            (>= ?duration 0)
            ;; Maximum necessary wait is 103 (120 - 17)
            (<= ?duration 255) ; Theoretical max wait, practically limited by the start condition below
        )
        :condition (and
            (at start (at presidio))
            (at start (< (current-time) 120)) ; Only possible if 9:00 AM < Current Time < 11:00 AM
            (at end (>= (current-time) 120))  ; Ensure time has passed 11:00 AM
        )
        :effect (at end (increase (current-time) ?duration))
    )

    ;; 3. Meet Matthew. Constraints: Duration >= 30 min. Start >= 120. End <= 255.
    (:durative-action meet-matthew
        :parameters ()
        :duration (and
            (>= ?duration 30)
        )
        :condition (and
            (at start (at presidio))
            (at start (>= (current-time) 120)) ; Must start after 11:00 AM
            ;; Deadline constraint: Start time + duration <= 255 (3:15 PM)
            (at start (<= (+ (current-time) ?duration) 255))
        )
        :effect (and
            (at end (increase (current-time) ?duration))
            (at end (meeting-completed))
        )
    )
    
    ;; 4. Travel back P -> NH (18 min) - Optional but defined for completeness
    (:durative-action travel-presidio-to-nh
        :parameters ()
        :duration (= ?duration 18)
        :condition (and
            (at start (at presidio))
            (at start (meeting-completed)) 
        )
        :effect (and
            (at end (not (at presidio)))
            (at end (at nob-hill))
            (at end (increase (current-time) 18))
        )
    )
)