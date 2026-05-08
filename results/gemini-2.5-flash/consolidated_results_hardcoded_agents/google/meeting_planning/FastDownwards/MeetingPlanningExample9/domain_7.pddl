(define (domain meeting-planning-temporal)
    (:requirements :durative-actions :typing :fluents)
    
    (:types
        location
    )

    (:predicates
        (at ?l - location)
        (arrived-at-nob-hill)
        (mary-available)        ; True when current-time >= 720 (12:00 PM)
        (meeting-completed)
    )
    
    (:functions
        (current-time) ; Absolute minutes from midnight (T=0)
    )

    ;; 1. Travel Union Square to Nob Hill (9 min)
    ;; Start T=540. End T=549.
    (:durative-action travel-us-nh
        :parameters ()
        :duration (= ?duration 9)
        :condition (and 
            (at start (at union-square))
        )
        :effect (and
            (at start (not (at union-square)))
            (at end (at nob-hill))
            (at end (arrived-at-nob-hill))
            (at end (increase (current-time) 9))
        )
    )

    ;; 2. Wait until Mary is available 
    ;; Arrival is T=549. Mary is available at T=720. Required Wait = 171 minutes.
    (:durative-action wait-for-availability
        :parameters ()
        :duration (= ?duration 171) 
        :condition (and
            (at start (at nob-hill))
            (at start (arrived-at-nob-hill))
            (at start (< (current-time) 720)) ; Must be started before Mary is available
        )
        :effect (and
            (at end (mary-available))
            (at end (increase (current-time) 171)) ; T_end = 720
        )
    )
    
    ;; 3. Meet Mary (Minimum 75 minutes)
    ;; Must start at/after T=720 and end at/before T=975.
    ;; We use the minimum required duration (75 min) to minimize makespan.
    ;; T_start=720, T_end=795.
    (:durative-action meet-mary
        :parameters ()
        :duration (= ?duration 75) 
        :condition (and
            (at start (at nob-hill))
            (at start (mary-available))
            (at start (>= (current-time) 720)) ; Start time constraint (12:00 PM)
            (at end (<= (current-time) 975))   ; End time constraint (4:15 PM)
        )
        :effect (and
            (at end (increase (current-time) 75))
            (at end (meeting-completed))
        )
    )
)