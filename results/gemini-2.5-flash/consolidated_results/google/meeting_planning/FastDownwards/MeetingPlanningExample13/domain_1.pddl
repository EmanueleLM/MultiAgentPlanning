(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions :numeric-fluents :action-costs)
    (:types location)
    (:predicates
        (at ?l - location)
        (met_betty_75)
    )

    (:functions
        (T) ; Current time in minutes since 9:00 AM
        (total-cost) 
    )

    ;; 1. Travel Presidio -> North Beach (18 min)
    (:action travel_p_to_nb
        :parameters ()
        :precondition (and
            (at presidio)
        )
        :effect (and
            (not (at presidio))
            (at northbeach)
            (increase (T) 18)
            (increase (total-cost) 18)
        )
    )

    ;; 2. Travel North Beach -> Presidio (17 min)
    (:action travel_nb_to_p
        :parameters ()
        :precondition (and
            (at northbeach)
        )
        :effect (and
            (not (at northbeach))
            (at presidio)
            (increase (T) 17)
            (increase (total-cost) 17)
        )
    )

    ;; 3. Wait actions to bridge the gap until 585 minutes (6:45 PM).
    ; The required gap time is 567 minutes if the agent travels immediately (T=18) or waits to T=567 before traveling (T=0).
    
    ; Wait 1: Wait at Presidio until T=567, optimal for immediate subsequent travel.
    (:action wait_at_p_until_567
        :parameters ()
        :precondition (and
            (at presidio)
            (= (T) 0)
        )
        :effect (and
            (increase (T) 567) 
            (increase (total-cost) 567)
        )
    )
    
    ; Wait 2: Wait at North Beach if the agent traveled early (T=18). Duration 585 - 18 = 567.
    (:action wait_at_nb_until_585
        :parameters ()
        :precondition (and
            (at northbeach)
            (= (T) 18)
        )
        :effect (and
            (increase (T) 567)
            (increase (total-cost) 567)
        )
    )

    ;; 4. Meet Betty (75 minutes duration)
    (:action meet_betty_for_75
        :parameters ()
        :precondition (and
            (at northbeach)
            (not (met_betty_75))

            ; Must start at or after 585 minutes (6:45 PM)
            (>= (T) 585) 

            ; Must start at or before 705 minutes (8:45 PM)
            (<= (T) 705) 
        )
        :effect (and
            (met_betty_75)
            ; Advance time by 75 minutes
            (increase (T) 75)
            (increase (total-cost) 75)
        )
    )
)