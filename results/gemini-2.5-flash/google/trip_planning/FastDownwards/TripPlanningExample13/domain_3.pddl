(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day_index
        num_count
    )
    (:predicates
        (current_day ?d - day_index)
        (at_city ?c - city)
        (next_day ?d1 - day_index ?d2 - day_index)
        (is_connected ?c1 - city ?c2 - city)
        (has_visited ?c - city)
        (days_in_lyon ?n - num_count)
        (days_in_bucharest ?n - num_count)
        (days_in_manchester ?n - num_count)
        (next_num ?n1 - num_count ?n2 - num_count)
        (lyon_relatives_met)
        (day_is_d13_or_later ?d - day_index)
    )

    (:action spend_day_in_lyon_activate_relatives_visit
        :parameters (?current_d - day_index ?next_d - day_index ?old_n - num_count ?new_n - num_count)
        :precondition (and
            (current_day ?current_d)
            (next_day ?current_d ?next_d)
            (at_city lyon)
            (days_in_lyon ?old_n)
            (next_num ?old_n ?new_n)
            (day_is_d13_or_later ?current_d) ; Must be in the relatives visit window
            (not (lyon_relatives_met)) ; Only set this predicate once
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (days_in_lyon ?old_n))
            (days_in_lyon ?new_n)
            (has_visited lyon)
            (lyon_relatives_met)
        )
    )

    (:action spend_day_in_lyon_continue_relatives_visit
        :parameters (?current_d - day_index ?next_d - day_index ?old_n - num_count ?new_n - num_count)
        :precondition (and
            (current_day ?current_d)
            (next_day ?current_d ?next_d)
            (at_city lyon)
            (days_in_lyon ?old_n)
            (next_num ?old_n ?new_n)
            (day_is_d13_or_later ?current_d) ; Must be in the relatives visit window
            (lyon_relatives_met) ; Relatives already met, continue stay
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (days_in_lyon ?old_n))
            (days_in_lyon ?new_n)
            (has_visited lyon)
        )
    )

    (:action spend_day_in_bucharest
        :parameters (?current_d - day_index ?next_d - day_index ?old_n - num_count ?new_n - num_count)
        :precondition (and
            (current_day ?current_d)
            (next_day ?current_d ?next_d)
            (at_city bucharest)
            (days_in_bucharest ?old_n)
            (next_num ?old_n ?new_n)
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (days_in_bucharest ?old_n))
            (days_in_bucharest ?new_n)
            (has_visited bucharest)
        )
    )

    (:action spend_day_in_manchester
        :parameters (?current_d - day_index ?next_d - day_index ?old_n - num_count ?new_n - num_count)
        :precondition (and
            (current_day ?current_d)
            (next_day ?current_d ?next_d)
            (at_city manchester)
            (days_in_manchester ?old_n)
            (next_num ?old_n ?new_n)
        )
        :effect (and
            (not (current_day ?current_d))
            (current_day ?next_d)
            (not (days_in_manchester ?old_n))
            (days_in_manchester ?new_n)
            (has_visited manchester)
        )
    )

    (:action travel
        :parameters (?from - city ?to - city) ; Travel is instantaneous, does not consume a day
        :precondition (and
            (at_city ?from)
            (is_connected ?from ?to)
        )
        :effect (and
            (not (at_city ?from))
            (at_city ?to)
            (has_visited ?to)
        )
    )
)