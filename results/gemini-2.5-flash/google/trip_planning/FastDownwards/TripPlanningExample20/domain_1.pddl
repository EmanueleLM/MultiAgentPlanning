(define (domain trip_planning_20)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        pday ; plan day, represents a point in time in the overall 12-day plan
        day_count_level ; symbolic counter for days spent in a specific city
    )
    (:predicates
        (at ?c - city)
        (visited ?c - city)
        (connected ?from ?to - city) ; Direct flight connection
        (current_position_in_plan ?p - pday) ; Current day in the 12-day plan
        (next_position_in_plan ?p1 ?p2 - pday) ; Defines sequence of days

        ; Track days spent in each city (adjusted durations: Istanbul 4, Budapest 5, Dubrovnik 3)
        (days_spent_in_istanbul ?n - day_count_level)
        (days_spent_in_budapest ?n - day_count_level)
        (days_spent_in_dubrovnik ?n - day_count_level)
        (next_count_level ?n1 ?n2 - day_count_level) ; Sequence for day counters
    )

    (:action travel)
        :parameters (?from ?to - city ?p_current ?p_next - pday)
        :precondition (and
            (at ?from)
            (connected ?from ?to)
            (current_position_in_plan ?p_current)
            (next_position_in_plan ?p_current ?p_next)
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (not (current_position_in_plan ?p_current))
            (current_position_in_plan ?p_next)
            (visited ?to) ; Mark city as visited upon arrival
        )

    (:action spend_day_in_istanbul)
        :parameters (?p_current ?p_next - pday ?current_days ?next_days - day_count_level)
        :precondition (and
            (at istanbul)
            (current_position_in_plan ?p_current)
            (next_position_in_plan ?p_current ?p_next)
            (days_spent_in_istanbul ?current_days)
            (next_count_level ?current_days ?next_days)
            (not (days_spent_in_istanbul c4)) ; Cannot spend more than 4 days (adjusted)
        )
        :effect (and
            (not (current_position_in_plan ?p_current))
            (current_position_in_plan ?p_next)
            (not (days_spent_in_istanbul ?current_days))
            (days_spent_in_istanbul ?next_days)
            (visited istanbul) ; Ensure istanbul is marked visited
        )

    (:action spend_day_in_budapest)
        :parameters (?p_current ?p_next - pday ?current_days ?next_days - day_count_level)
        :precondition (and
            (at budapest)
            (current_position_in_plan ?p_current)
            (next_position_in_plan ?p_current ?p_next)
            (days_spent_in_budapest ?current_days)
            (next_count_level ?current_days ?next_days)
            (not (days_spent_in_budapest c5)) ; Cannot spend more than 5 days (adjusted)
        )
        :effect (and
            (not (current_position_in_plan ?p_current))
            (current_position_in_plan ?p_next)
            (not (days_spent_in_budapest ?current_days))
            (days_spent_in_budapest ?next_days)
            (visited budapest) ; Ensure budapest is marked visited
        )

    (:action spend_day_in_dubrovnik)
        :parameters (?p_current ?p_next - pday ?current_days ?next_days - day_count_level)
        :precondition (and
            (at dubrovnik)
            (current_position_in_plan ?p_current)
            (next_position_in_plan ?p_current ?p_next)
            (days_spent_in_dubrovnik ?current_days)
            (next_count_level ?current_days ?next_days)
            (not (days_spent_in_dubrovnik c3)) ; Cannot spend more than 3 days (adjusted)
        )
        :effect (and
            (not (current_position_in_plan ?p_current))
            (current_position_in_plan ?p_next)
            (not (days_spent_in_dubrovnik ?current_days))
            (days_spent_in_dubrovnik ?next_days)
            (visited dubrovnik) ; Ensure dubrovnik is marked visited
        )
)