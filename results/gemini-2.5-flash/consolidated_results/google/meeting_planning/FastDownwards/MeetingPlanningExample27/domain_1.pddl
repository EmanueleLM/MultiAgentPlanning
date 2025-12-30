(define (domain meeting-scheduling)
    (:requirements :typing :durative-actions :negative-preconditions :action-costs) 
    
    (:types
        location
    )
    
    (:predicates
        (at ?l - location)
        (meeting-successful)
    )

    (:functions
        (current-time) ; Time in minutes
        (total-meetings-successful)
    )

    ; Travel 1: Marina District to Pacific Heights (7 minutes)
    (:durative-action travel_Marina_to_Pacific_Heights
        :parameters ()
        :duration (= ?duration 7)
        :condition (and
            (at start (at marina-district))
        )
        :effect (and
            (at end (not (at marina-district)))
            (at end (at pacific-heights))
            (at end (increase (current-time) ?duration))
        )
    )

    ; Travel 2: Pacific Heights to Marina District (6 minutes)
    (:durative-action travel_Pacific_Heights_to_Marina
        :parameters ()
        :duration (= ?duration 6)
        :condition (and
            (at start (at pacific-heights))
        )
        :effect (and
            (at end (not (at pacific-heights)))
            (at end (at marina-district))
            (at end (increase (current-time) ?duration))
        )
    )
    
    ; Meeting Margaret: Pacific Heights, 1140 (7:00 PM) to 1185 (7:45 PM), min 15 minutes duration.
    (:durative-action meet_margaret
        :parameters ()
        ; Duration constraints: Min 15 minutes
        :duration (and (>= ?duration 15))
        
        :condition (and 
            (at start (at pacific-heights))
            ; Availability start constraint (1140 min)
            (at start (>= (current-time) 1140)) 
            ; Availability end constraint (1185 min)
            (at end (<= (current-time) 1185))
        )
        :effect (and 
            (at end (meeting-successful))
            (at end (increase (total-meetings-successful) 1))
            (at end (increase (current-time) ?duration))
        )
    )
)