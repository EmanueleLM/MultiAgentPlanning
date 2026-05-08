(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions :numeric-fluents :action-costs :universal-preconditions)
    (:types
        agent city day
    )
    (:predicates
        (next-day ?d1 - day ?d2 - day)
        (connected ?c1 - city ?c2 - city)
        (conference-required ?c - city ?d - day)
        (current-agent-location ?a - agent ?c - city)
        (current-day ?d - day)
    )
    (:functions
        (total-days-dubrovnik) - number
        (total-days-berlin) - number
        (total-days-munich) - number
        (total-cost) - number
    )

    (define (action stay-at-city)
        :parameters (?a - agent ?c - city ?d - day ?next_d - day)
        :precondition (and
            (current-day ?d)
            (current-agent-location ?a ?c)
            (next-day ?d ?next_d)
            (forall (?other_c - city) (or (not (conference-required ?other_c ?next_d)) (= ?c ?other_c)))
        )
        :effect (and
            (not (current-day ?d))
            (current-day ?next_d)
            (when (= ?c dubrovnik) (increase (total-days-dubrovnik) 1))
            (when (= ?c berlin) (increase (total-days-berlin) 1))
            (when (= ?c munich) (increase (total-days-munich) 1))
            (increase (total-cost) 1)
        )
    )

    (define (action travel-to-city)
        :parameters (?a - agent ?from_c - city ?to_c - city ?d - day ?next_d - day)
        :precondition (and
            (current-day ?d)
            (current-agent-location ?a ?from_c)
            (connected ?from_c ?to_c)
            (next-day ?d ?next_d)
            (not (= ?from_c ?to_c))
            (forall (?other_c - city) (or (not (conference-required ?other_c ?next_d)) (= ?to_c ?other_c)))
        )
        :effect (and
            (not (current-agent-location ?a ?from_c))
            (current-agent-location ?a ?to_c)
            (not (current-day ?d))
            (current-day ?next_d)
            (when (= ?to_c dubrovnik) (increase (total-days-dubrovnik) 1))
            (when (= ?to_c berlin) (increase (total-days-berlin) 1))
            (when (= ?to_c munich) (increase (total-days-munich) 1))
            (increase (total-cost) 2)
        )
    )
)