(define (domain meeting-scheduling)
    (:requirements :strips :typing :durative-actions)
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

    ; Stage 1: Wait until T=533 (5:53 PM) to ensure travel ends exactly at 6:00 PM.
    (:durative-action wait-for-travel-start
        :parameters ()
        :duration (= ?duration 533)
        :condition (and 
            (at start (current-stage S0))
            (at start (at us))
        )
        :effect (and
            (at end (not (current-stage S0)))
            (at end (current-stage S1)) ; Ready to travel
        )
    )

    ; Stage 2: Travel from US to CH (7 minutes). Arrives at T=540 (6:00 PM).
    (:durative-action travel-us-ch
        :parameters ()
        :duration (= ?duration 7)
        :condition (and
            (at start (current-stage S1))
            (at start (at us))
        )
        :effect (and
            (at start (not (at us)))
            (at end (at ch))
            (at end (not (current-stage S1)))
            (at end (current-stage S2)) ; Ready to meet Joshua
        )
    )

    ; Stage 3: Meet Joshua. Duration must be >= 75 minutes and <= 210 minutes (750 - 540).
    (:durative-action meet-joshua
        :parameters (?p - person ?l - location)
        :duration (and (>= ?duration 75) (<= ?duration 210))
        :condition (and
            (at start (current-stage S2)) ; Must start at or after T=540
            (at start (at ?l))
            (overall (available ?p ?l))
            (at start (not (met ?p)))
        )
        :effect (and
            (at end (met ?p))
            (at end (not (current-stage S2)))
            (at end (current-stage S3)) ; Meeting complete
        )
    )
)