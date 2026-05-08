(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types city day count)
    (:predicates
        (at ?c - city ?d - day)          ;; The traveler is in city ?c at the end of day ?d (or after a flight)
        (visited ?c - city ?d - day)     ;; City ?c was visited at some point during day ?d
        (current_day ?d - day)           ;; The current timeline marker
        (flew_today ?d - day)            ;; A flight has already been taken on day ?d
        (visit_count ?c - city ?n - count) ;; City ?c has been visited for ?n discrete days
        (next_day ?d1 ?d2 - day)         ;; Timeline sequence
        (next_count ?n1 ?n2 - count)     ;; Integer sequence for visit counts
        (can_fly ?c1 ?c2 - city)         ;; Direct flight availability
    )

    ;; The stay action represents spending a day in the current city and transitioning to the next day.
    ;; It increments the visit count for the city of arrival for the new day.
    (:action stay
        :parameters (?city - city ?d_from - day ?d_to - day ?n_from - count ?n_to - count)
        :precondition (and
            (current_day ?d_from)
            (at ?city ?d_from)
            (next_day ?d_from ?d_to)
            (visit_count ?city ?n_from)
            (next_count ?n_from ?n_to)
        )
        :effect (and
            (not (current_day ?d_from))
            (current_day ?d_to)
            (at ?city ?d_to)
            (visited ?city ?d_to)
            (not (visit_count ?city ?n_from))
            (visit_count ?city ?n_to)
        )
    )

    ;; The fly action represents taking a direct flight on the current day.
    ;; It moves the traveler from one city to another within the same day.
    ;; This allows both cities to be counted as visited on that day, satisfying tight schedules.
    (:action fly
        :parameters (?from - city ?to - city ?day - day ?n_from - count ?n_to - count)
        :precondition (and
            (current_day ?day)
            (at ?from ?day)
            (can_fly ?from ?to)
            (not (flew_today ?day))
            (visit_count ?to ?n_from)
            (next_count ?n_from ?n_to)
        )
        :effect (and
            (not (at ?from ?day))
            (at ?to ?day)
            (visited ?to ?day)
            (flew_today ?day)
            (not (visit_count ?to ?n_from))
            (visit_count ?to ?n_to)
        )
    )
)