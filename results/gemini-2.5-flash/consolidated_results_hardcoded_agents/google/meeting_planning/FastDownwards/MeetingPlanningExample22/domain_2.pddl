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
    )

    (:action travel_presidio_to_unionsquare
        :parameters (?a - agent)
        :precondition
            (and
                (is-at ?a presidio)
                (current-time T540)
            )
        :effect
            (and
                (not (is-at ?a presidio))
                (is-at ?a unionsquare)
                (not (current-time T540))
                (current-time T562) ; Arrive 22 minutes later (9:22 AM)
            )
    )
    
    (:action wait_for_andrew_availability
        :parameters (?a - agent)
        :precondition
            (and
                (is-at ?a unionsquare)
                (current-time T562)
            )
        :effect
            (and
                (not (current-time T562))
                (current-time T675) ; Andrew becomes available (11:15 AM)
                (is-available andrew)
            )
    )

    (:action meet_andrew_105_min
        :parameters (?a - agent ?f - friend ?l - location)
        :precondition
            (and
                (is-at ?a ?l)
                (= ?l unionsquare)
                (= ?f andrew)
                (is-available ?f)
                (not (met ?f))
                (current-time T675) 
            )
        :effect
            (and
                (met ?f)
                (not (current-time T675))
                (current-time T780) ; End time 105 minutes later (1:00 PM)
            )
    )
)