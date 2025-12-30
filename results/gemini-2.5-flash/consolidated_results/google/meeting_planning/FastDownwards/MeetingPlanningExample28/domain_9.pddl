(define (domain meeting-scheduling)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types 
        location 
        person 
        stage
    )

    (:predicates
        (at ?l - location)
        (available ?p - person ?l - location) 
        (met ?p - person)
        (current-stage ?s - stage)
    )

    (:functions
        (total-cost) ; Tracks total elapsed time (in minutes)
    )

    ; Stage 1: Wait until T=533 (5:53 PM) to ensure travel ends exactly at 6:00 PM.
    (:action wait-for-travel-start
        :parameters ()
        :precondition (and 
            (current-stage S0)
            (at us)
        )
        :effect (and
            (not (current-stage S0))
            (current-stage S1) ; Ready to travel
            (increase (total-cost) 533)
        )
    )

    ; Stage 2: Travel from US to CH (7 minutes). Starts at T=533, ends at T=540 (6:00 PM).
    (:action travel-us-ch
        :parameters ()
        :precondition (and
            (current-stage S1)
            (at us)
        )
        :effect (and
            (not (at us))
            (at ch)
            (not (current-stage S1))
            (current-stage S2) ; Ready to meet Joshua
            (increase (total-cost) 7)
        )
    )

    ; Stage 3: Meet Joshua for exactly 75 minutes (minimum required). Starts T=540, ends T=615.
    (:action meet-joshua
        :parameters (?p - person ?l - location)
        :precondition (and
            (current-stage S2) 
            (at ?l)
            (available ?p ?l)
            (not (met ?p))
        )
        :effect (and
            (met ?p)
            (not (current-stage S2))
            (current-stage S3) ; Meeting complete
            (increase (total-cost) 75)
        )
    )
)