(define (domain meeting-scheduler-temporal)
    (:requirements :durative-actions :typing :fluents :negative-preconditions)
    (:types
        location
        friend
    )

    (:predicates
        (at ?l - location)
        (ready-to-travel) ; Condition met to start 23 min travel to arrive at 1050 (i.e., current-time >= 1027)
        (john-met-duration-satisfied)
    )

    (:constants
        bayview - location
        russian-hill - location
        john - friend
    )

    (:functions
        (current-time) ; Absolute minutes from midnight (Start 540)
    )
    
    ; 1. Wait until optimal departure time (1027)
    ; Allows waiting 487 minutes or longer if needed, ensuring we reach 1027 before traveling.
    (:durative-action wait-for-departure
        :parameters ()
        :duration (?t)
        :condition (and
            (at start (at bayview))
            (at start (not (ready-to-travel))) ; Only perform once
            (at start (<= (current-time) 1027)) 
            (at end (>= ?t 1))
            (at end (>= (+ (current-time) ?t) 1027)) ; Must reach 1027 or later
        )
        :effect (and
            (at end (increase (current-time) ?t))
            (at end (ready-to-travel))
        )
    )

    ; 2. Travel to Russian Hill (Fixed Duration 23 minutes)
    (:durative-action travel-to-russianhill
        :parameters ()
        :duration (= ?duration 23)
        :condition (and
            (at start (at bayview))
            (at start (ready-to-travel))
            ; Arrival check: Start time + 23 must be <= John's end time (1260)
            (at start (<= (+ (current-time) 23) 1260)) 
            ; Start check: must be >= 1027 for optimal arrival at 1050
            (at start (>= (current-time) 1027)) 
        )
        :effect (and
            (at start (not (at bayview)))
            (at end (at russian-hill))
            (at end (increase (current-time) ?duration))
            (at end (not (ready-to-travel)))
        )
    )

    ; 3. Meet John (Minimum duration 75 minutes)
    (:durative-action meet-john
        :parameters ()
        :duration (?t)
        :condition (and
            (at start (at russian-hill))
            (over all (at russian-hill))
            (at start (not (john-met-duration-satisfied)))
            
            ; Availability window: Start time must be >= 1050
            (at start (>= (current-time) 1050))
            ; Availability window: End time must be <= 1260
            (at end (<= (+ (current-time) ?t) 1260))
            
            ; Minimum duration constraint
            (at end (>= ?t 75))
        )
        :effect (and
            (at end (increase (current-time) ?t))
            (at end (john-met-duration-satisfied))
        )
    )
)