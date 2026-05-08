(define (domain trip_planning_20)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        pday ; plan day, represents a point in time in the overall 12-day plan
        day_count_level ; symbolic counter for days spent in a specific city
    )
    (:predicates
        (at ?c - city) ; The agent's current location
        (visited ?c - city) ; Marks a city as visited at least once
        (connected ?from ?to - city) ; Direct flight connection
        (current_position_in_plan ?p - pday) ; Current day in the overall 12-day trip
        (next_position_in_plan ?p1 ?p2 - pday) ; Defines the sequence of plan days (e.g., pday_0 to pday_1)

        (days_spent_in ?c - city ?n - day_count_level) ; Tracks days spent in a specific city
        (max_days_for_city ?c - city ?n - day_count_level) ; Defines the target/maximum days for a city
        (next_count_level ?n1 ?n2 - day_count_level) ; Defines sequence for day counters (e.g., c0 to c1)
    )

    (:action travel
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
    )

    (:action spend_day
        :parameters (?c - city ?p_current ?p_next - pday ?current_days ?next_days - day_count_level)
        :precondition (and
            (at ?c) ; Must be currently in the city
            (current_position_in_plan ?p_current)
            (next_position_in_plan ?p_current ?p_next) ; Advance the overall trip day
            (days_spent_in ?c ?current_days) ; Current day count for this city
            (next_count_level ?current_days ?next_days) ; Increment the city day count
            (max_days_for_city ?c ?max_allowed_days) ; Get the maximum allowed days for this city
            (not (days_spent_in ?c ?max_allowed_days)) ; Cannot spend a day if already at the max allowed for this city
        )
        :effect (and
            (not (current_position_in_plan ?p_current))
            (current_position_in_plan ?p_next)
            (not (days_spent_in ?c ?current_days))
            (days_spent_in ?c ?next_days)
            (visited ?c) ; Ensure the city is marked as visited
        )
    )
)