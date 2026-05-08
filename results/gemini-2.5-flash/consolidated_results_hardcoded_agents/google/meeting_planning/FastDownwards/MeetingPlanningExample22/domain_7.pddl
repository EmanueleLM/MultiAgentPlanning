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
        ; Temporal progression stages
        (is-successor ?t1 - time_point ?t2 - time_point)
    )

    ; Travel Presidio to Union Square: Duration 22 minutes (T540 -> T562)
    (:action travel-p-to-us
        :parameters (?a - agent ?t1 ?t2 - time_point)
        :precondition
            (and
                (is-at ?a PRESIDIO)
                (current-time ?t1)
                (is-successor ?t1 ?t2)
            )
        :effect
            (and
                (not (is-at ?a PRESIDIO))
                (is-at ?a UNIONSQUARE)
                (not (current-time ?t1))
                (current-time ?t2) 
            )
    )
    
    ; Wait until Andrew is available at 11:15 AM (T562 -> T675)
    (:action wait-for-andrew-availability
        :parameters (?a - agent ?t1 ?t2 - time_point)
        :precondition
            (and
                (is-at ?a UNIONSQUARE)
                (current-time ?t1)
                (is-successor ?t1 ?t2)
            )
        :effect
            (and
                (not (current-time ?t1))
                (current-time ?t2) 
                (is-available andrew) ; Andrew available at T675 (11:15 AM)
            )
    )

    ; Meet Andrew for exactly 105 minutes (T675 -> T780)
    (:action meet-andrew
        :parameters (?a - agent ?f - friend ?t1 ?t2 - time_point)
        :precondition
            (and
                (is-at ?a UNIONSQUARE)
                (= ?f andrew)
                (is-available ?f)
                (not (met ?f))
                (current-time ?t1) 
                (is-successor ?t1 ?t2) ; T780 is T675 + 105 min
            )
        :effect
            (and
                (met ?f)
                (not (current-time ?t1))
                (current-time ?t2) 
            )
    )
    
    ; Travel Union Square to Presidio: Duration 24 minutes (T780 -> T804)
    (:action travel-us-to-p
        :parameters (?a - agent ?t1 ?t2 - time_point)
        :precondition
            (and
                (is-at ?a UNIONSQUARE)
                (current-time ?t1) 
                (is-successor ?t1 ?t2)
            )
        :effect
            (and
                (not (is-at ?a UNIONSQUARE))
                (is-at ?a PRESIDIO)
                (not (current-time ?t1))
                (current-time ?t2) 
            )
    )
)