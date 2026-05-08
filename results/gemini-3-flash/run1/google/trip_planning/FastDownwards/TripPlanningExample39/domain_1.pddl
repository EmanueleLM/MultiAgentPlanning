(define (domain trip_planning_example_39)
    (:requirements :strips :typing)
    (:types city day count)
    (:predicates
        (at_city ?c - city)
        (current_day ?d - day)
        (city_count ?c - city ?n - count)
        (next_day ?d1 - day ?d2 - day)
        (next_count ?n1 - count ?n2 - count)
        (can_fly ?c1 - city ?c2 - city)
        (day_visited ?c - city ?d - day)
    )

    ;; The 'stay' action represents spending a whole day in one city.
    ;; It increments the stay count for that city and advances the day.
    (:action stay
        :parameters (?c - city ?d - day ?nd - day ?c_curr - count ?c_next - count)
        :precondition (and
            (at_city ?c)
            (current_day ?d)
            (next_day ?d ?nd)
            (city_count ?c ?c_curr)
            (next_count ?c_curr ?c_next)
        )
        :effect (and
            (not (current_day ?d))
            (current_day ?nd)
            (not (city_count ?c ?c_curr))
            (city_count ?c ?c_next)
            (day_visited ?c ?d)
        )
    )

    ;; The 'fly' action represents a travel day between two cities.
    ;; To resolve the discrepancy between total trip duration (12 days) and the sum 
    ;; of requested stays (14 days), the travel day is modeled as counting toward 
    ;; the stay duration of both the origin and the destination cities.
    (:action fly
        :parameters (?from - city ?to - city ?d - day ?nd - day ?c_from_curr - count ?c_from_next - count ?c_to_curr - count ?c_to_next - count)
        :precondition (and
            (at_city ?from)
            (can_fly ?from ?to)
            (current_day ?d)
            (next_day ?d ?nd)
            (city_count ?from ?c_from_curr)
            (next_count ?c_from_curr ?c_from_next)
            (city_count ?to ?c_to_curr)
            (next_count ?c_to_curr ?c_to_next)
        )
        :effect (and
            (not (at_city ?from))
            (at_city ?to)
            (not (current_day ?d))
            (current_day ?nd)
            (not (city_count ?from ?c_from_curr))
            (city_count ?from ?c_from_next)
            (not (city_count ?to ?c_to_curr))
            (city_count ?to ?c_to_next)
            (day_visited ?from ?d)
            (day_visited ?to ?d)
        )
    )
)