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
    (:action travel_p_to_us
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
                (current-time T562) 
            )
    )
    
    ; Wait until 11:15 AM (T675) when Andrew is available (562 -> 675, a wait of 113 min)
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
                (current-time T675) ; Andrew available (11:15 AM)
                (is-available andrew)
            )
    )

    ; Meet Andrew for minimum 105 minutes (T675 -> T780 = 1:00 PM)
    (:action meet_andrew
        :parameters (?a - agent ?f - friend)
        :precondition
            (and
                (is-at ?a unionsquare)
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
    (:action travel_us_to_p
        :parameters (?a - agent)
        :precondition
            (and
                (is-at ?a unionsquare)
                (current-time T780) 
            )
        :effect
            (and
                (not (is-at ?a unionsquare))
                (is-at ?a presidio)
                (not (current-time T780))
                (current-time T804) 
            )
    )
)