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

    ; Travel Presidio (P) to Union Square (US): 22 minutes (T540 -> T562)
    (:action travel-p-to-us
        :parameters (?a - agent)
        :precondition
            (and
                (is-at ?a PRESIDIO)
                (current-time T540)
            )
        :effect
            (and
                (not (is-at ?a PRESIDIO))
                (is-at ?a UNIONSQUARE)
                (not (current-time T540))
                (current-time T562) 
            )
    )
    
    ; Wait until 11:15 AM (T675) when Andrew is available (562 -> 675, a wait of 113 min)
    (:action wait-for-andrew-availability
        :parameters (?a - agent)
        :precondition
            (and
                (is-at ?a UNIONSQUARE)
                (current-time T562)
            )
        :effect
            (and
                (not (current-time T562))
                (current-time T675) ; Andrew available (11:15 AM)
                (is-available andrew)
            )
    )

    ; Meet Andrew for minimum 105 minutes (T675 -> T780 = 1:00 PM)
    (:action meet-andrew
        :parameters (?a - agent ?f - friend)
        :precondition
            (and
                (is-at ?a UNIONSQUARE)
                (= ?f andrew)
                (is-available ?f)
                (not (met ?f))
                (current-time T675) 
            )
        :effect
            (and
                (met ?f)
                (not (current-time T675))
                (current-time T780) 
            )
    )
    
    ; Travel Union Square (US) to Presidio (P): 24 minutes (T780 -> T804)
    (:action travel-us-to-p
        :parameters (?a - agent)
        :precondition
            (and
                (is-at ?a UNIONSQUARE)
                (current-time T780) 
            )
        :effect
            (and
                (not (is-at ?a UNIONSQUARE))
                (is-at ?a PRESIDIO)
                (not (current-time T780))
                (current-time T804) 
            )
    )