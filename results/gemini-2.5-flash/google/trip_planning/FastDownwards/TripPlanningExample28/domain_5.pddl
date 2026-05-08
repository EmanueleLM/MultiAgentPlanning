(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day_count
    )
    (:predicates
        (traveler_at ?c - city) ; The traveler's current location
        (has_spent_day_in ?c - city) ; Marks a city as having at least one day spent in it
        (direct_flight ?from ?to - city) ; Connectivity between cities

        (current_total_days ?d - day_count) ; Tracks the total number of days spent
        (next_day ?d1 ?d2 - day_count) ; Successor relation for day counts

        ; Tracks days spent in each specific city
        (days_spent_in ?c - city ?d - day_count)

        (trip_not_started) ; Flag to ensure the trip can only be started once
    )

    (:action start_trip
        :parameters (?c - city)
        :precondition (trip_not_started)
        :effect (and
            (traveler_at ?c)
            (not (trip_not_started)) ; Trip has now started
        )
    )

    (:action fly
        :parameters (?from ?to - city)
        :precondition (and
            (traveler_at ?from)
            (direct_flight ?from ?to)
        )
        :effect (and
            (not (traveler_at ?from))
            (traveler_at ?to)
        )
    )

    (:action spend_day
        :parameters (
            ?c - city
            ?current_total_d ?next_total_d - day_count
            ?current_city_d ?next_city_d - day_count
        )
        :precondition (and
            (traveler_at ?c)
            (current_total_days ?current_total_d)
            (next_day ?current_total_d ?next_total_d) ; Total days can be incremented
            (days_spent_in ?c ?current_city_d)
            (next_day ?current_city_d ?next_city_d) ; City-specific days can be incremented
        )
        :effect (and
            (not (current_total_days ?current_total_d))
            (current_total_days ?next_total_d)
            (not (days_spent_in ?c ?current_city_d))
            (days_spent_in ?c ?next_city_d)
            (has_spent_day_in ?c) ; Mark city as visited
        )
    )
)