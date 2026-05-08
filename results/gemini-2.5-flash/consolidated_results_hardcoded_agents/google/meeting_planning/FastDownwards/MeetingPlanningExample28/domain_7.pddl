(define (domain meeting-scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        location 
        person 
        state_flag 
    )

    (:predicates
        (at ?l - location)
        (available ?p - person ?l - location) 
        (met ?p - person)
        (phase ?s - state_flag) 
    )

    (:functions
        (total-cost)
    )

    ; Action 1: Wait until T=533 (5:53 PM), the latest time to start travel to arrive exactly at 6:00 PM.
    (:action wait_for_travel_window
        :parameters ()
        :precondition (and 
            (phase phase-0)
            (at us)
        )
        :effect (and
            (not (phase phase-0))
            (phase phase-1) ; Ready to travel at T=533
            (increase (total-cost) 533)
        )
    )

    ; Action 2: Travel from US to CH (7 minutes). Arrives at T=540 (6:00 PM).
    (:action travel_us_ch
        :parameters ()
        :precondition (and
            (phase phase-1)
            (at us)
        )
        :effect (and
            (not (at us))
            (at ch)
            (not (phase phase-1))
            (phase phase-2) ; Ready to meet Joshua (T = 540)
            (increase (total-cost) 7) 
        )
    )

    ; Action 3: Meet Joshua for the minimum required duration (75 minutes). Ends at T=615 (7:15 PM).
    (:action meet_joshua_75_min
        :parameters (?p - person ?l - location)
        :precondition (and
            (phase phase-2) ; Meeting starts at 6:00 PM (T=540)
            (at ?l)
            (available ?p ?l)
            (not (met ?p))
        )
        :effect (and
            (met ?p)
            (not (phase phase-2))
            (phase phase-3) ; Meeting finished (T=615)
            (increase (total-cost) 75) 
        )
    )