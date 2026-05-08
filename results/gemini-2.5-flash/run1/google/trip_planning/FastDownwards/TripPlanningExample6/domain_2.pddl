(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        agent city day
    )
    (:predicates
        (next-day ?d1 - day ?d2 - day)
        (connected ?c1 - city ?c2 - city)
        (conference-required ?c - city ?d - day) ; Static requirement for conference locations
        (current-agent-location ?a - agent ?c - city) ; The city the agent is *currently* in for the current processing day
        (current-day ?d - day) ; The day whose state we are currently deciding/acting upon (progresses from day1 to day8)
    )
    (:functions
        (total-days-dubrovnik) - number
        (total-days-berlin) - number
        (total-days-munich) - number
        (total-cost) - number
    )

    ;; Action to stay in the current city for the next day
    (define (action stay-at-city)
        :parameters (?a - agent ?c - city ?d - day ?next_d - day)
        :precondition (and
            (current-day ?d)
            (current-agent-location ?a ?c)
            (next-day ?d ?next_d)
            ;; If there is any conference requirement on next_d, it *must* be in city ?c
            (not (exists (?other_c - city) (and (conference-required ?other_c ?next_d) (not (= ?c ?other_c)))))
        )
        :effect (and
            (not (current-day ?d))
            (current-day ?next_d)
            ;; current-agent-location remains ?a ?c, implicitly meaning for next_d as no change is specified
            (when (= ?c dubrovnik) (increase (total-days-dubrovnik) 1))
            (when (= ?c berlin) (increase (total-days-berlin) 1))
            (when (= ?c munich) (increase (total-days-munich) 1))
            (increase (total-cost) 1) ; Cost for passing a day
        )
    )

    ;; Action to travel to a new city for the next day
    (define (action travel-to-city)
        :parameters (?a - agent ?from_c - city ?to_c - city ?d - day ?next_d - day)
        :precondition (and
            (current-day ?d)
            (current-agent-location ?a ?from_c)
            (connected ?from_c ?to_c)
            (next-day ?d ?next_d)
            (not (= ?from_c ?to_c)) ; Must be a move to a different city
            ;; If there is any conference requirement on next_d, it *must* be in city ?to_c
            (not (exists (?other_c - city) (and (conference-required ?other_c ?next_d) (not (= ?to_c ?other_c)))))
        )
        :effect (and
            (not (current-agent-location ?a ?from_c))
            (current-agent-location ?a ?to_c)
            (not (current-day ?d))
            (current-day ?next_d)
            (when (= ?to_c dubrovnik) (increase (total-days-dubrovnik) 1))
            (when (= ?to_c berlin) (increase (total-days-berlin) 1))
            (when (= ?to_c munich) (increase (total-days-munich) 1))
            (increase (total-cost) 2) ; Cost for travel + passing a day
        )
    )