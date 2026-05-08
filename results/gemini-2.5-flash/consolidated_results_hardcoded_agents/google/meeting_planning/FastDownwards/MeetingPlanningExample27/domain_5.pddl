(define (domain meeting-scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs) 
    
    (:types
        location
    )
    
    (:predicates
        (at ?l - location)
        (meeting-successful)
    )

    (:functions
        (total-meetings-successful)
        ; total-cost is implicitly defined by :action-costs and used for time tracking
    )

    ; Travel 1: Marina District to Pacific Heights (7 minutes)
    (:action travel_marina_to_pacific_heights
        :parameters ()
        :precondition (and
            (at marina-district)
        )
        :effect (and
            (not (at marina-district))
            (at pacific-heights)
            (increase (total-cost) 7)
        )
    )

    ; Travel 2: Pacific Heights to Marina District (6 minutes)
    (:action travel_pacific_heights_to_marina
        :parameters ()
        :precondition (and
            (at pacific-heights)
        )
        :effect (and
            (not (at pacific-heights))
            (at marina-district)
            (increase (total-cost) 6)
        )
    )
    
    ; Meeting Margaret: Pacific Heights. Duration 15 minutes.
    ; Availability: 1140 (7:00 PM) to 1185 (7:45 PM).
    ; Start time T_start must satisfy: 1140 <= T_start <= 1185 - 15 = 1170.
    (:action meet_margaret_15min
        :parameters ()
        :precondition (and 
            (at pacific-heights)
            (not (meeting-successful))
            (>= (total-cost) 1140) 
            (<= (total-cost) 1170)
        )
        :effect (and 
            (meeting-successful)
            (increase (total-meetings-successful) 1)
            (increase (total-cost) 15)
        )
    )
)