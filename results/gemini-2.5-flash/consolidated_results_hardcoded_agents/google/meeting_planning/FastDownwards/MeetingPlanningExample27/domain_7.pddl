(define (domain meeting-scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs) 
    
    (:types
        location
    )
    
    (:predicates
        (at ?l - location)
        (is-marina ?l - location)
        (is-pacific-heights ?l - location)
        (meeting-successful)
    )

    (:functions
        (total-meetings-successful)
        (total-cost) ; Explicitly defined for time tracking
    )

    ; Travel 1: Marina District to Pacific Heights (7 minutes)
    (:action travel_marina_to_pacific_heights
        :parameters (?m - location ?p - location)
        :precondition (and
            (is-marina ?m)
            (is-pacific-heights ?p)
            (at ?m)
        )
        :effect (and
            (not (at ?m))
            (at ?p)
            (increase (total-cost) 7)
        )
    )

    ; Travel 2: Pacific Heights to Marina District (6 minutes)
    (:action travel_pacific_heights_to_marina
        :parameters (?p - location ?m - location)
        :precondition (and
            (is-pacific-heights ?p)
            (is-marina ?m)
            (at ?p)
        )
        :effect (and
            (not (at ?p))
            (at ?m)
            (increase (total-cost) 6)
        )
    )
    
    ; Wait 100 minutes (for long gaps)
    (:action wait_100_minutes
        :parameters (?l - location)
        :precondition (and 
            (is-pacific-heights ?l) ; Ensure waiting at the meeting location type
            (at ?l) 
            (< (total-cost) 1070) 
        )
        :effect (increase (total-cost) 100)
    )
    
    ; Wait 1 minute (for precision near the target window)
    (:action wait_1_minute
        :parameters (?l - location)
        :precondition (and 
            (is-pacific-heights ?l) ; Ensure waiting at the meeting location type
            (at ?l)
            (< (total-cost) 1170) ; Cannot wait past the last possible meeting start time
        )
        :effect (increase (total-cost) 1)
    )
    
    ; Meeting Margaret: Pacific Heights. Duration 15 minutes (7:00 PM (1140) to 7:45 PM (1185)).
    ; Start time T_start must satisfy: 1140 <= T_start <= 1170 (1185 - 15).
    (:action meet_margaret_15min
        :parameters (?p - location)
        :precondition (and 
            (is-pacific-heights ?p)
            (at ?p)
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