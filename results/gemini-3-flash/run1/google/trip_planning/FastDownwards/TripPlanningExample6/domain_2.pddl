(define (domain trip_planning)
    (:requirements :strips :typing)
    (:types city day count)
    (:predicates
        (at ?c - city ?d - day)
        (current_day ?d - day)
        (visit_count ?c - city ?n - count)
        (next_day ?d1 ?d2 - day)
        (next_count ?n1 ?n2 - count)
        (can_fly ?c1 ?c2 - city)
    )

    ;; The stay action represents spending the next day in the same city.
    ;; It increments the visit count for that city and advances the timeline.
    (:action stay
        :parameters (?c - city ?d_from - day ?d_to - day ?n_from - count ?n_to - count)
        :precondition (and
            (current_day ?d_from)
            (at ?c ?d_from)
            (next_day ?d_from ?d_to)
            (visit_count ?c ?n_from)
            (next_count ?n_from ?n_to)
        )
        :effect (and
            (not (current_day ?d_from))
            (current_day ?d_to)
            (at ?c ?d_to)
            (not (visit_count ?c ?n_from))
            (visit_count ?c ?n_to)
        )
    )

    ;; The fly action represents traveling to a new city to spend the next day there.
    ;; It increments the visit count for the destination city and advances the timeline.
    (:action fly
        :parameters (?from - city ?to - city ?d_from - day ?d_to - day ?n_from - count ?n_to - count)
        :precondition (and
            (current_day ?d_from)
            (at ?from ?d_from)
            (can_fly ?from ?to)
            (next_day ?d_from ?d_to)
            (visit_count ?to ?n_from)
            (next_count ?n_from ?n_to)
        )
        :effect (and
            (not (current_day ?d_from))
            (current_day ?d_to)
            (at ?to ?d_to)
            (not (visit_count ?to ?n_from))
            (visit_count ?to ?n_to)
        )
    )
)