(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        person
        city
        day
        day_count_istanbul
        day_count_tallinn
        day_count_zurich
    )
    (:predicates
        (at ?p - person ?c - city)
        (current_day ?d - day)
        (next_day_is ?d1 - day ?d2 - day)
        (direct_flight ?from - city ?to - city)

        (istanbul_days_spent ?n - day_count_istanbul)
        (next_istanbul_day_count_is ?n1 - day_count_istanbul ?n2 - day_count_istanbul)

        (tallinn_days_spent ?n - day_count_tallinn)
        (next_tallinn_day_count_is ?n1 - day_count_tallinn ?n2 - day_count_tallinn)

        (zurich_days_spent ?n - day_count_zurich)
        (next_zurich_day_count_is ?n1 - day_count_zurich ?n2 - day_count_zurich)

        (show_happening_on ?d - day)
        (attended_zurich_show)
    )

    (:action travel
        :parameters (?p - person ?from - city ?to - city ?current_d - day ?next_d - day)
        :precondition (and
            (at ?p ?from)
            (direct_flight ?from ?to)
            (current_day ?current_d)
            (next_day_is ?current_d ?next_d)
        )
        :effect (and
            (not (at ?p ?from))
            (at ?p ?to)
            (not (current_day ?current_d))
            (current_day ?next_d)
            (increase (total-cost) 1)
        )
    )

    (:action stay_in_istanbul
        :parameters (?p - person ?current_d - day ?next_d - day ?current_n - day_count_istanbul ?next_n - day_count_istanbul)
        :precondition (and
            (at ?p istanbul)
            (current_day ?current_d)
            (next_day_is ?current_d ?next_d)
            (istanbul_days_spent ?current_n)
            (next_istanbul_day_count_is ?current_n ?next_n)
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (istanbul_days_spent ?current_n))
            (istanbul_days_spent ?next_n)
            (increase (total-cost) 1)
        )
    )

    (:action stay_in_tallinn
        :parameters (?p - person ?current_d - day ?next_d - day ?current_n - day_count_tallinn ?next_n - day_count_tallinn)
        :precondition (and
            (at ?p tallinn)
            (current_day ?current_d)
            (next_day_is ?current_d ?next_d)
            (tallinn_days_spent ?current_n)
            (next_tallinn_day_count_is ?current_n ?next_n)
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (tallinn_days_spent ?current_n))
            (tallinn_days_spent ?next_n)
            (increase (total-cost) 1)
        )
    )

    (:action stay_in_zurich_and_attend_show
        :parameters (?p - person ?current_d - day ?next_d - day ?current_n - day_count_zurich ?next_n - day_count_zurich)
        :precondition (and
            (at ?p zurich)
            (current_day ?current_d)
            (next_day_is ?current_d ?next_d)
            (zurich_days_spent ?current_n)
            (next_zurich_day_count_is ?current_n ?next_n)
            (show_happening_on ?current_d)
            (not (attended_zurich_show))
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (zurich_days_spent ?current_n))
            (zurich_days_spent ?next_n)
            (attended_zurich_show)
            (increase (total-cost) 1)
        )
    )

    (:action stay_in_zurich_no_show
        :parameters (?p - person ?current_d - day ?next_d - day ?current_n - day_count_zurich ?next_n - day_count_zurich)
        :precondition (and
            (at ?p zurich)
            (current_day ?current_d)
            (next_day_is ?current_d ?next_d)
            (zurich_days_spent ?current_n)
            (next_zurich_day_count_is ?current_n ?next_n)
            (or (not (show_happening_on ?current_d)) (attended_zurich_show))
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (zurich_days_spent ?current_n))
            (zurich_days_spent ?next_n)
            (increase (total-cost) 1)
        )
    )
)