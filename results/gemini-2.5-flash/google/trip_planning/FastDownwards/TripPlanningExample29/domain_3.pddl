(define (domain trip_planning_example29)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        city
        day
        agent
    )
    (:predicates
        (at ?a - agent ?c - city)
        (connected ?c1 - city ?c2 - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (day_spent_in_city ?a - agent ?c - city ?d - day)
        (visited_city ?c - city)
        (is_last_day ?d - day)
    )
    (:functions
        (total-cost)
    )

    ;; Action to spend a full day in the current city and advance to the next day.
    ;; The current day is marked as spent in this city.
    (:action spend_day_in_city
        :parameters (?a - agent ?c - city ?d_current - day ?d_next - day)
        :precondition (and
            (at ?a ?c)
            (current_day ?d_current)
            (next_day ?d_current ?d_next)
        )
        :effect (and
            (not (current_day ?d_current))
            (current_day ?d_next)
            (day_spent_in_city ?a ?c ?d_current)
            (visited_city ?c)
            (increase (total-cost) 1)
        )
    )

    ;; Action to fly between cities, which consumes one full day for travel.
    ;; The agent changes location, and the current day advances. The day of travel
    ;; is not marked as a 'day_spent_in_city'.
    (:action fly_between_cities
        :parameters (?a - agent ?from_c - city ?to_c - city ?d_current - day ?d_next - day)
        :precondition (and
            (at ?a ?from_c)
            (connected ?from_c ?to_c)
            (current_day ?d_current)
            (next_day ?d_current ?d_next)
        )
        :effect (and
            (not (at ?a ?from_c))
            (at ?a ?to_c)
            (not (current_day ?d_current))
            (current_day ?d_next)
            (visited_city ?to_c)
            (increase (total-cost) 1)
        )
    )

    ;; Special action for the very last day of the trip (day10).
    ;; This allows marking day10 as spent in a city without requiring a 'next_day'
    ;; predicate to exist, as day10 is the end of the planning horizon.
    (:action spend_last_day_in_city
        :parameters (?a - agent ?c - city ?d_current - day)
        :precondition (and
            (at ?a ?c)
            (current_day ?d_current)
            (is_last_day ?d_current) ; Changed to use a predicate for the last day
        )
        :effect (and
            (day_spent_in_city ?a ?c ?d_current)
            (visited_city ?c)
            (increase (total-cost) 1)
        )
    )
)