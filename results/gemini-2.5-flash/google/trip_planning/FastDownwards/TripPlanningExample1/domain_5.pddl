(define (domain trip_planning_example1)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city - object
        day_index - object
        count_level_riga - object
        count_level_manchester - object
        count_level_split - object
    )
    (:predicates
        (at ?c - city)
        (current_day ?d - day_index)
        (next_day ?d1 ?d2 - day_index)
        (visited ?c - city)
        (direct_flight ?from ?to - city)
        (days_in_riga_is ?cr - count_level_riga)
        (days_in_manchester_is ?cm - count_level_manchester)
        (days_in_split_is ?cs - count_level_split)
        (next_riga_level ?cr1 ?cr2 - count_level_riga)
        (next_manchester_level ?cm1 ?cm2 - count_level_manchester)
        (next_split_level ?cs1 ?cs2 - count_level_split)
        (not_at_any_city)
    )

    (:action start_trip_at_riga
        :parameters (?d0 - day_index ?d1 - day_index ?cr0 - count_level_riga ?cr1 - count_level_riga)
        :precondition (and
            (current_day ?d0)
            (next_day ?d0 ?d1)
            (days_in_riga_is ?cr0)
            (next_riga_level ?cr0 ?cr1)
            (not_at_any_city)
        )
        :effect (and
            (not (current_day ?d0))
            (current_day ?d1)
            (not (not_at_any_city))
            (at riga)
            (visited riga)
            (not (days_in_riga_is ?cr0))
            (days_in_riga_is ?cr1)
        )
    )

    (:action start_trip_at_manchester
        :parameters (?d0 - day_index ?d1 - day_index ?cm0 - count_level_manchester ?cm1 - count_level_manchester)
        :precondition (and
            (current_day ?d0)
            (next_day ?d0 ?d1)
            (days_in_manchester_is ?cm0)
            (next_manchester_level ?cm0 ?cm1)
            (not_at_any_city)
        )
        :effect (and
            (not (current_day ?d0))
            (current_day ?d1)
            (not (not_at_any_city))
            (at manchester)
            (visited manchester)
            (not (days_in_manchester_is ?cm0))
            (days_in_manchester_is ?cm1)
        )
    )

    (:action start_trip_at_split
        :parameters (?d0 - day_index ?d1 - day_index ?cs0 - count_level_split ?cs1 - count_level_split)
        :precondition (and
            (current_day ?d0)
            (next_day ?d0 ?d1)
            (days_in_split_is ?cs0)
            (next_split_level ?cs0 ?cs1)
            (not_at_any_city)
        )
        :effect (and
            (not (current_day ?d0))
            (current_day ?d1)
            (not (not_at_any_city))
            (at split)
            (visited split)
            (not (days_in_split_is ?cs0))
            (days_in_split_is ?cs1)
        )
    )

    (:action travel_between_cities
        :parameters (?from - city ?to - city ?d1 - day_index ?d2 - day_index)
        :precondition (and
            (current_day ?d1)
            (next_day ?d1 ?d2)
            (at ?from)
            (direct_flight ?from ?to)
        )
        :effect (and
            (not (current_day ?d1))
            (current_day ?d2)
            (not (at ?from))
            (at ?to)
            (visited ?to)
        )
    )

    (:action stay_in_riga
        :parameters (?d1 - day_index ?d2 - day_index ?cr1 - count_level_riga ?cr2 - count_level_riga)
        :precondition (and
            (at riga)
            (current_day ?d1)
            (next_day ?d1 ?d2)
            (days_in_riga_is ?cr1)
            (next_riga_level ?cr1 ?cr2)
        )
        :effect (and
            (not (current_day ?d1))
            (current_day ?d2)
            (not (days_in_riga_is ?cr1))
            (days_in_riga_is ?cr2)
        )
    )

    (:action stay_in_manchester
        :parameters (?d1 - day_index ?d2 - day_index ?cm1 - count_level_manchester ?cm2 - count_level_manchester)
        :precondition (and
            (at manchester)
            (current_day ?d1)
            (next_day ?d1 ?d2)
            (days_in_manchester_is ?cm1)
            (next_manchester_level ?cm1 ?cm2)
        )
        :effect (and
            (not (current_day ?d1))
            (current_day ?d2)
            (not (days_in_manchester_is ?cm1))
            (days_in_manchester_is ?cm2)
        )
    )

    (:action stay_in_split
        :parameters (?d1 - day_index ?d2 - day_index ?cs1 - count_level_split ?cs2 - count_level_split)
        :precondition (and
            (at split)
            (current_day ?d1)
            (next_day ?d1 ?d2)
            (days_in_split_is ?cs1)
            (next_split_level ?cs1 ?cs2)
        )
        :effect (and
            (not (current_day ?d1))
            (current_day ?d2)
            (not (days_in_split_is ?cs1))
            (days_in_split_is ?cs2)
        )
    )
)