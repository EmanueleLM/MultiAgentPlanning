(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        person
        day_level
        venice_day_counter
        dubrovnik_day_counter
        istanbul_day_counter
    )
    (:predicates
        (at ?p - person ?c - city)
        (has_visited ?c - city)
        (flight_path ?from - city ?to - city)

        ;; Global trip day counter
        (current_day_level ?dl - day_level)
        (is_next_day ?from_dl - day_level ?to_dl - day_level)

        ;; Venice specific stay day counter
        (current_venice_stay_count ?vc - venice_day_counter)
        (is_next_venice_day ?from_vc - venice_day_counter ?to_vc - venice_day_counter)

        ;; Dubrovnik specific stay day counter
        (current_dubrovnik_stay_count ?dc - dubrovnik_day_counter)
        (is_next_dubrovnik_day ?from_dc - dubrovnik_day_counter ?to_dc - dubrovnik_day_counter)

        ;; Istanbul specific stay day counter
        (current_istanbul_stay_count ?ic - istanbul_day_counter)
        (is_next_istanbul_day ?from_ic - istanbul_day_counter ?to_ic - istanbul_day_counter)
    )

    ;; Action: Fly between cities
    ;; A flight consumes 1 day from the total trip duration.
    ;; It also marks the destination city as visited.
    (:action fly
        :parameters (?p - person ?from - city ?to - city ?from_dl - day_level ?to_dl - day_level)
        :precondition (and
            (at ?p ?from)
            (flight_path ?from ?to)
            (current_day_level ?from_dl)
            (is_next_day ?from_dl ?to_dl)
        )
        :effect (and
            (not (at ?p ?from))
            (at ?p ?to)
            (not (current_day_level ?from_dl))
            (current_day_level ?to_dl)
            (has_visited ?to)
        )
    )

    ;; Action: Stay in Venice for one day
    ;; This action consumes 1 day from the total trip duration and 1 day for Venice.
    ;; It's only possible if the total trip duration is within budget and Venice stay is not at its desired maximum.
    (:action stay_in_venice
        :parameters (?p - person ?from_dl - day_level ?to_dl - day_level ?from_vc - venice_day_counter ?to_vc - venice_day_counter)
        :precondition (and
            (at ?p venice)
            (current_day_level ?from_dl)
            (is_next_day ?from_dl ?to_dl)
            (current_venice_stay_count ?from_vc)
            (is_next_venice_day ?from_vc ?to_vc)
        )
        :effect (and
            (not (current_day_level ?from_dl))
            (current_day_level ?to_dl)
            (not (current_venice_stay_count ?from_vc))
            (current_venice_stay_count ?to_vc)
        )
    )

    ;; Action: Stay in Dubrovnik for one day
    ;; This action consumes 1 day from the total trip duration and 1 day for Dubrovnik.
    ;; It's only possible if the total trip duration is within budget and Dubrovnik stay is not at its desired maximum.
    (:action stay_in_dubrovnik
        :parameters (?p - person ?from_dl - day_level ?to_dl - day_level ?from_dc - dubrovnik_day_counter ?to_dc - dubrovnik_day_counter)
        :precondition (and
            (at ?p dubrovnik)
            (current_day_level ?from_dl)
            (is_next_day ?from_dl ?to_dl)
            (current_dubrovnik_stay_count ?from_dc)
            (is_next_dubrovnik_day ?from_dc ?to_dc)
        )
        :effect (and
            (not (current_day_level ?from_dl))
            (current_day_level ?to_dl)
            (not (current_dubrovnik_stay_count ?from_dc))
            (current_dubrovnik_stay_count ?to_dc)
        )
    )

    ;; Action: Stay in Istanbul for one day
    ;; This action consumes 1 day from the total trip duration and 1 day for Istanbul.
    ;; It's only possible if the total trip duration is within budget and Istanbul stay is not at its desired maximum.
    (:action stay_in_istanbul
        :parameters (?p - person ?from_dl - day_level ?to_dl - day_level ?from_ic - istanbul_day_counter ?to_ic - istanbul_day_counter)
        :precondition (and
            (at ?p istanbul)
            (current_day_level ?from_dl)
            (is_next_day ?from_dl ?to_dl)
            (current_istanbul_stay_count ?from_ic)
            (is_next_istanbul_day ?from_ic ?to_ic)
        )
        :effect (and
            (not (current_day_level ?from_dl))
            (current_day_level ?to_dl)
            (not (current_istanbul_stay_count ?from_ic))
            (current_istanbul_stay_count ?to_ic)
        )
    )
)