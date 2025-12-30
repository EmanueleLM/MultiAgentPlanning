(define (domain meeting-scheduling)
    (:requirements (:strips :typing :negative-preconditions))
    (:types 
        location 
        person 
        time-marker
    )

    (:predicates
        (at ?l - location)
        (available ?p - person ?l - location)
        (met ?p - person)
        (time-state ?t - time-marker) ; t0=9:00 AM, t533=5:53 PM, t540=6:00 PM, t615=7:15 PM
    )

    ; 1. Wait action (Implicitly 533 minutes elapsed: 9:00 AM to 5:53 PM)
    (:action wait-for-departure-window
        :precondition (and 
            (at us)
            (time-state t0)
        )
        :effect (and
            (not (time-state t0))
            (time-state t533)
        )
    )

    ; 2. Travel action (Implicitly 7 minutes elapsed: 5:53 PM to 6:00 PM)
    (:action travel-us-ch-for-meeting
        :precondition (and
            (at us)
            (time-state t533)
        )
        :effect (and
            (not (at us))
            (at ch)
            (not (time-state t533))
            (time-state t540) 
        )
    )

    ; 3. Meeting action (Implicitly 75 minutes elapsed: 6:00 PM to 7:15 PM)
    ; Start T540 >= 6:00 PM. End T615 <= 9:30 PM (T750). Duration 75 minutes satisfied.
    (:action meet-joshua-75-minutes
        :precondition (and
            (at ch)
            (time-state t540)
            (available joshua ch)
            (not (met joshua))
        )
        :effect (and
            (met joshua)
            (not (time-state t540))
            (time-state t615) 
        )
    )
)