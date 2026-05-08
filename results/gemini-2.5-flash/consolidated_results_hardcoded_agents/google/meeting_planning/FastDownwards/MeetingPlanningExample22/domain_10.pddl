(define (domain meeting-planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        location
        agent
        friend
        time_point
    )

    (:predicates
        (is-at ?a - agent ?l - location)
        (met ?f - friend)
        (current-time ?t - time_point)
        (is-available ?f - friend)
        (is-successor ?t1 - time_point ?t2 - time_point)
    )

    ; Travel Presidio to Union Square: Duration 22 minutes (T540 -> T562)
    (:action travel-p-to-us
        :parameters (?a - agent ?t1 ?t2 - time_point)
        :precondition
            (and
                (is-at ?a presidio)
                (current-time ?t1)
                (is-successor ?t1 ?t2) 
            )
        :effect
            (and
                (not (is-at ?a presidio))
                (is-at ?a unionsquare)
                (not (current-time ?t1))
                (current-time ?t2) 
            )
    )
    
    ; Wait until Andrew is available (T562 -> T675, 11:15 AM)
    (:action wait-for-andrew-availability
        :parameters (?a - agent ?t1 ?t2 - time_point)
        :precondition
            (and
                (is-at ?a unionsquare)
                (current-time ?t1)
                (is-successor ?t1 ?t2)
                (not (is-available andrew))
            )
        :effect
            (and
                (not (current-time ?t1))
                (current-time ?t2) 
                (is-available andrew)
            )
    )

    ; Meet Andrew for exactly 105 minutes (T675 -> T780)
    (:action meet-andrew-105-minutes
        :parameters (?a - agent ?t1 ?t2 - time_point)
        :precondition
            (and
                (is-at ?a unionsquare)
                (is-available andrew)
                (not (met andrew))
                (current-time ?t1) 
                (is-successor ?t1 ?t2) 
            )
        :effect
            (and
                (met andrew)
                (not (current-time ?t1))
                (current-time ?t2) 
            )
    )
    
    ; Travel Union Square to Presidio: Duration 24 minutes (T780 -> T804)
    (:action travel-us-to-p
        :parameters (?a - agent ?t1 ?t2 - time_point)
        :precondition
            (and
                (is-at ?a unionsquare)
                (current-time ?t1) 
                (is-successor ?t1 ?t2)
            )
        :effect
            (and
                (not (is-at ?a unionsquare))
                (is-at ?a presidio)
                (not (current-time ?t1))
                (current-time ?t2) 
            )
    )
)