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

    ; 1. Wait action: Models time elapsed while staying at location ?l (T0 to T533)
    (:action wait
        :parameters (?l - location ?t_start - time-marker ?t_end - time-marker)
        :precondition (and 
            (at ?l)
            (time-state ?t_start)
        )
        :effect (and
            (not (time-state ?t_start))
            (time-state ?t_end)
        )
    )

    ; 2. Travel action: Models the 7 minute transit (T533 to T540)
    (:action travel
        :parameters (?l_from - location ?l_to - location ?t_start - time-marker ?t_end - time-marker)
        :precondition (and
            (at ?l_from)
            (time-state ?t_start)
        )
        :effect (and
            (not (at ?l_from))
            (at ?l_to)
            (not (time-state ?t_start))
            (time-state ?t_end) 
        )
    )

    ; 3. Meeting action: Models the required 75 minute meeting (T540 to T615)
    (:action meet
        :parameters (?p - person ?l - location ?t_start - time-marker ?t_end - time-marker)
        :precondition (and
            (at ?l)
            (time-state ?t_start)
            (available ?p ?l)
            (not (met ?p))
        )
        :effect (and
            (met ?p)
            (not (time-state ?t_start))
            (time-state ?t_end) 
        )
    )
)