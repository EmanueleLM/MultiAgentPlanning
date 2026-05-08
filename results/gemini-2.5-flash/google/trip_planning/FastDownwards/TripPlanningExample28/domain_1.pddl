(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day_count
    )
    (:predicates
        (traveler_at ?c - city) ; The traveler's current location
        (has_visited ?c - city) ; Marks a city as visited at least once
        (direct_flight ?from ?to - city) ; Connectivity between cities

        (current_total_days ?d - day_count) ; Tracks the total number of days spent
        (next_day ?d1 ?d2 - day_count) ; Successor relation for day counts

        ; Track days spent in each specific city (for detailed plan tracking)
        (days_in_venice ?d - day_count)
        (days_in_florence ?d - day_count)
        (days_in_zurich ?d - day_count)

        (trip_not_started) ; Flag to ensure the trip can only be started once
    )

    (:action start_trip
        :parameters (?c - city)
        :precondition (trip_not_started)
        :effect (and
            (traveler_at ?c)
            (has_visited ?c)
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
            (has_visited ?to) ; Mark destination city as visited
        )
    )

    (:action spend_day_in_venice
        :parameters (
            ?current_total_d ?next_total_d - day_count
            ?current_venice_d ?next_venice_d - day_count
        )
        :precondition (and
            (traveler_at venice)
            (current_total_days ?current_total_d)
            (next_day ?current_total_d ?next_total_d) ; Total days can be incremented
            (days_in_venice ?current_venice_d)
            (next_day ?current_venice_d ?next_venice_d) ; Venice days can be incremented
        )
        :effect (and
            (not (current_total_days ?current_total_d))
            (current_total_days ?next_total_d)
            (not (days_in_venice ?current_venice_d))
            (days_in_venice ?next_venice_d)
        )
    )

    (:action spend_day_in_florence
        :parameters (
            ?current_total_d ?next_total_d - day_count
            ?current_florence_d ?next_florence_d - day_count
        )
        :precondition (and
            (traveler_at florence)
            (current_total_days ?current_total_d)
            (next_day ?current_total_d ?next_total_d)
            (days_in_florence ?current_florence_d)
            (next_day ?current_florence_d ?next_florence_d)
        )
        :effect (and
            (not (current_total_days ?current_total_d))
            (current_total_days ?next_total_d)
            (not (days_in_florence ?current_florence_d))
            (days_in_florence ?next_florence_d)
        )
    )

    (:action spend_day_in_zurich
        :parameters (
            ?current_total_d ?next_total_d - day_count
            ?current_zurich_d ?next_zurich_d - day_count
        )
        :precondition (and
            (traveler_at zurich)
            (current_total_days ?current_total_d)
            (next_day ?current_total_d ?next_total_d)
            (days_in_zurich ?current_zurich_d)
            (next_day ?current_zurich_d ?next_zurich_d)
        )
        :effect (and
            (not (current_total_days ?current_total_d))
            (current_total_days ?next_total_d)
            (not (days_in_zurich ?current_zurich_d))
            (days_in_zurich ?next_zurich_d)
        )
    )
)