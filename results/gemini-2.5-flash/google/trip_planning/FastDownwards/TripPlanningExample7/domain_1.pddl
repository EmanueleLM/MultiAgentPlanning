(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions :action-costs :numeric-fluents)
    (:types
        city
        person
    )
    (:predicates
        (at ?p - person ?c - city)
        (has_visited ?c - city)
        (flight_path ?from - city ?to - city)
    )
    (:functions
        (total_days_spent)
        (days_in_venice)
        (days_in_dubrovnik)
        (days_in_istanbul)
    )

    ;; Action: Fly between cities
    ;; A flight consumes 1 day from the total trip duration.
    ;; It also marks the destination city as visited.
    (:action fly
        :parameters (?p - person ?from - city ?to - city)
        :precondition (and
            (at ?p ?from)
            (flight_path ?from ?to)
            (< (total_days_spent) 11) ;; Ensure total trip duration does not exceed 11 days with this flight
        )
        :effect (and
            (not (at ?p ?from))
            (at ?p ?to)
            (increase (total_days_spent) 1)
            (has_visited ?to)
        )
    )

    ;; Action: Stay in Venice for one day
    ;; This action consumes 1 day from the total trip duration and 1 day for Venice.
    ;; It's only possible if the total trip duration is within budget and Venice stay is not at its desired maximum.
    (:action stay_in_venice
        :parameters (?p - person)
        :precondition (and
            (at ?p venice)
            (< (total_days_spent) 11) ;; Ensure total trip duration does not exceed 11 days with this stay
            (< (days_in_venice) 6)   ;; Desired stay in Venice is 6 days
        )
        :effect (and
            (increase (total_days_spent) 1)
            (increase (days_in_venice) 1)
        )
    )

    ;; Action: Stay in Dubrovnik for one day
    ;; This action consumes 1 day from the total trip duration and 1 day for Dubrovnik.
    ;; It's only possible if the total trip duration is within budget and Dubrovnik stay is not at its desired maximum.
    (:action stay_in_dubrovnik
        :parameters (?p - person)
        :precondition (and
            (at ?p dubrovnik)
            (< (total_days_spent) 11) ;; Ensure total trip duration does not exceed 11 days with this stay
            (< (days_in_dubrovnik) 4) ;; Desired stay in Dubrovnik is 4 days
        )
        :effect (and
            (increase (total_days_spent) 1)
            (increase (days_in_dubrovnik) 1)
        )
    )

    ;; Action: Stay in Istanbul for one day
    ;; This action consumes 1 day from the total trip duration and 1 day for Istanbul.
    ;; It's only possible if the total trip duration is within budget and Istanbul stay is not at its desired maximum.
    (:action stay_in_istanbul
        :parameters (?p - person)
        :precondition (and
            (at ?p istanbul)
            (< (total_days_spent) 11) ;; Ensure total trip duration does not exceed 11 days with this stay
            (< (days_in_istanbul) 3)  ;; Desired stay in Istanbul is 3 days
        )
        :effect (and
            (increase (total_days_spent) 1)
            (increase (days_in_istanbul) 1)
        )
    )
)