(define (domain meeting-planning-temporal)
    (:requirements :typing :durative-actions :negative-preconditions :action-costs)
    
    (:types
        location
    )

    (:predicates
        (at ?l - location)
        (meeting-completed)
    )
    
    (:functions
        (current-time) ; Absolute time in minutes from midnight.
    )

    ;; 1. Travel Union Square to Nob Hill (9 min)
    (:durative-action travel-us-nh
        :parameters ()
        :duration (= ?duration 9)
        :condition (and
            (at start (at union-square))
        )
        :effect (and
            (at start (not (at union-square)))
            (at end (at nob-hill))
            (at end (increase (current-time) ?duration))
        )
    )

    ;; 2. Meet Mary (Min duration 75 minutes)
    ;; Must start at or after 720 and end at or before 975.
    (:durative-action meet-mary
        :parameters ()
        :duration (?d >= 75) 
        :condition (and
            (at start (at nob-hill))
            ; Constraint: Must start at or after 12:00 PM (720 min)
            (at start (>= (current-time) 720)) 
            ; Constraint: Must finish at or before 4:15 PM (975 min)
            (at end (<= (current-time) 975)) 
        )
        :effect (and
            (at end (meeting-completed))
            (at end (increase (current-time) ?d))
        )
    )
)