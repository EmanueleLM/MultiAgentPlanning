(define (domain trip_planning)
    (:requirements :strips :typing :fluents) ; Added :fluents requirement
    (:types
        city
        person
    )
    (:predicates
        (at ?p - person ?c - city)
        (has_visited ?c - city)
        (flight_path ?from - city ?to - city)
    )
    (:functions ; Define numeric fluents for tracking days
        (total_trip_days)
        (venice_stay_days)
        (dubrovnik_stay_days)
        (istanbul_stay_days)
    )

    ;; Action: Fly between cities
    ;; A flight consumes 1 day from the total trip duration.
    ;; It also marks the destination city as visited.
    (:action fly
        :parameters (?p - person ?from - city ?to - city)
        :precondition (and
            (at ?p ?from)
            (flight_path ?from ?to)
            (< (total_trip_days) 11) ; Ensure total trip days do not exceed 11
        )
        :effect (and
            (not (at ?p ?from))
            (at ?p ?to)
            (increase (total_trip_days) 1)
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
            (< (total_trip_days) 11)   ; Ensure total trip days do not exceed 11
            (< (venice_stay_days) 6)    ; Ensure Venice stay days do not exceed desired 6
        )
        :effect (and
            (increase (total_trip_days) 1)
            (increase (venice_stay_days) 1)
        )
    )

    ;; Action: Stay in Dubrovnik for one day
    ;; This action consumes 1 day from the total trip duration and 1 day for Dubrovnik.
    ;; It's only possible if the total trip duration is within budget and Dubrovnik stay is not at its desired maximum.
    (:action stay_in_dubrovnik
        :parameters (?p - person)
        :precondition (and
            (at ?p dubrovnik)
            (< (total_trip_days) 11)   ; Ensure total trip days do not exceed 11
            (< (dubrovnik_stay_days) 4) ; Ensure Dubrovnik stay days do not exceed desired 4
        )
        :effect (and
            (increase (total_trip_days) 1)
            (increase (dubrovnik_stay_days) 1)
        )
    )

    ;; Action: Stay in Istanbul for one day
    ;; This action consumes 1 day from the total trip duration and 1 day for Istanbul.
    ;; It's only possible if the total trip duration is within budget and Istanbul stay is not at its desired maximum.
    (:action stay_in_istanbul
        :parameters (?p - person)
        :precondition (and
            (at ?p istanbul)
            (< (total_trip_days) 11)   ; Ensure total trip days do not exceed 11
            (< (istanbul_stay_days) 3) ; Ensure Istanbul stay days do not exceed desired 3
        )
        :effect (and
            (increase (total_trip_days) 1)
            (increase (istanbul_stay_days) 1)
        )
    )
)