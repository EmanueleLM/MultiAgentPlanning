(define (domain meeting-planning)
    (:requirements :durative-actions :typing :fluents :numeric-preconditions :negative-preconditions :equality)
    
    (:types
        location
    )

    (:predicates
        (at ?l - location)
    )
    
    (:functions
        (current-time)       ; Absolute minutes from midnight (0:00)
        (total-meeting-time) ; Tracks how long we met Mary (goal metric)
    )

    ; Action 1: Travel Union Square to Nob Hill (9 minutes)
    (:durative-action travel-us-nh
        :parameters ()
        :duration (= ?duration 9)
        :condition (and
            (at start (at union-square))
        )
        :effect (and
            (at start (not (at union-square)))
            (at end (at nob-hill))
            (at end (increase (current-time) 9))
        )
    )
    
    ; Action 2: Wait until Mary is available (12:00 PM / T=720)
    ; This action is only applicable if current-time < 720 upon arrival at Nob Hill.
    (:durative-action wait-for-availability
        :parameters ()
        :duration (= ?duration (- 720 (current-time)))
        :condition (and
            (at start (at nob-hill))
            (at start (< (current-time) 720))
        )
        :effect (and
            ; Sets the time exactly to 720, accounting for the duration spent waiting
            (at end (assign (current-time) 720)) 
        )
    )

    ; Action 3: Meet Mary (Minimum 75 minutes)
    ; Must start at or after 720. Must end at or before 975.
    (:durative-action meet-mary
        :parameters ()
        ; Duration must be >= 75 and cannot exceed the remaining time until 975.
        :duration (and 
            (>= ?duration 75)
            (<= ?duration (- 975 (current-time)))
        )
        :condition (and
            (at start (at nob-hill))
            (at start (>= (current-time) 720)) ; Start after 12:00 PM
        )
        :effect (and
            (at end (increase (total-meeting-time) ?duration))
            (at end (increase (current-time) ?duration))
        )
    )
    
    ; Action 4: Travel Nob Hill to Union Square (7 minutes) - Optional
    (:durative-action travel-nh-us
        :parameters ()
        :duration (= ?duration 7)
        :condition (and
            (at start (at nob-hill))
        )
        :effect (and
            (at start (not (at nob-hill)))
            (at end (at union-square))
            (at end (increase (current-time) 7))
        )
    )
)