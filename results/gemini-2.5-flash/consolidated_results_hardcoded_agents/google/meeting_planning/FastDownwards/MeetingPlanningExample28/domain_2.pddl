(define (domain meeting-scheduling)
    (:requirements :strips :typing :negative-preconditions)
    (:types 
        location 
        person 
        time-marker
    )

    (:predicates
        (at ?l - location)
        (available ?p - person ?l - location)
        (met ?p - person)
        (time-state ?t - time-marker)
    )

    ; 1. Wait action (Represents time elapsed from 9:00 AM T0 to 5:53 PM T533)
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

    ; 2. Travel action (Represents 7 minutes elapsed: 5:53 PM T533 to 6:00 PM T540)
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

    ; 3. Meeting action (Represents 75 minutes elapsed: 6:00 PM T540 to 7:15 PM T615)
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