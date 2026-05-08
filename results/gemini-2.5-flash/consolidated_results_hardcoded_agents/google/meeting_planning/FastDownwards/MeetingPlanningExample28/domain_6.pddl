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
        (phase ?s - state_flag) ; p0=T<533, p1=T=533, p2=T=540, p3=T=615
    )

    (:functions
        (total-cost) ; Tracks elapsed time in minutes
    )

    ; Action 1: Wait until T=533 (5:53 PM), the latest time to start travel to arrive exactly at 6:00 PM.
    (:action wait_for_travel_window
        :parameters ()
        :precondition (and 
            (phase p0)
            (at us)
        )
        :effect (and
            (not (phase p0))
            (phase p1) ; Ready to travel
            (increase (total-cost) 533)
        )
    )

    ; Action 2: Travel from US to CH (7 minutes). Arrives at T=540 (6:00 PM).
    (:action travel_us_ch
        :parameters ()
        :precondition (and
            (phase p1)
            (at us)
        )
        :effect (and
            (not (at us))
            (at ch)
            (not (phase p1))
            (phase p2) ; Ready to meet Joshua (T = 540)
            (increase (total-cost) 7) 
        )
    )

    ; Action 3: Meet Joshua for the minimum required duration (75 minutes). Ends at T=615 (7:15 PM).
    (:action meet_joshua_75_min
        :parameters (?p - person ?l - location)
        :precondition (and
            (phase p2) ; Meeting starts at 6:00 PM or later
            (at ?l)
            (available ?p ?l)
            (not (met ?p))
        )
        :effect (and
            (met ?p)
            (not (phase p2))
            (phase p3) ; Meeting finished (T=615, well before 750 deadline)
            (increase (total-cost) 75) 
        )
    )
)