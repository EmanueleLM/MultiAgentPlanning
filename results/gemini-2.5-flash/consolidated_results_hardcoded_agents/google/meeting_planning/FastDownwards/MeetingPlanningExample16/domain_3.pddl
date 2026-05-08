(define (domain meeting-sf)
    (:requirements :strips :typing :negative-preconditions :action-costs :durative-actions :numeric-fluents)

    (:types 
        location
    )

    (:predicates
        (at ?l - location)
        (met_ronald) 
    )
    
    (:functions
        (current-time)
        (total-meeting-time)
    )
    
    ; Travel from Chinatown to Russian Hill (7 minutes)
    (:durative-action travel-chinatown-russianhill
        :parameters ()
        :duration (= ?duration 7)
        :condition
            (at start (at chinatown))
        :effect
            (at end (at russian-hill))
            (at end (not (at chinatown)))
            (at end (increase (current-time) 7))
    )

    ; Travel from Russian Hill to Chinatown (9 minutes)
    (:durative-action travel-russianhill-chinatown
        :parameters ()
        :duration (= ?duration 9)
        :condition
            (at start (at russian-hill))
        :effect
            (at end (at chinatown))
            (at end (not (at russian-hill)))
            (at end (increase (current-time) 9))
    )
    
    ; Action to represent waiting time until Ronald is available
    (:durative-action wait
        :parameters (?l - location)
        :duration (?duration)
        :condition
            (at start (at ?l))
            (at start (> ?duration 0))
            ; Constraint: Do not wait past the end of the meeting window (1290 minutes)
            (at end (<= (current-time) 1290))
        :effect
            (at end (increase (current-time) ?duration))
    )

    ; Action to meet Ronald. Availability: 915 min (3:15 PM) to 1290 min (9:30 PM). Min duration: 105 min.
    (:durative-action meet-ronald
        :parameters ()
        :duration (?duration)
        :condition
            (at start (at russian-hill))
            ; Start time constraint: Must start at or after 915
            (at start (>= (current-time) 915)) 
            ; End time constraint: Must end at or before 1290
            (at end (<= (current-time) 1290))
            ; Minimum duration constraint: 105 minutes
            (>= ?duration 105)                 
        :effect
            (at end (increase (current-time) ?duration))
            (at end (increase (total-meeting-time) ?duration))
            (at end (met_ronald))
    )