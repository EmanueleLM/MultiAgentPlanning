(define (domain trip_planning_example_14)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        day_count_lyon
        day_count_frankfurt
        day_count_krakow
    )
    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (next_day ?d1 ?d2 - day)
        (is_flight_connected ?c1 ?c2 - city)
        (stayed_in ?c - city ?d - day)
        (travelled_on ?d - day)

        (num_days_spent_lyon ?dc - day_count_lyon)
        (next_lyon_day_count ?dc1 ?dc2 - day_count_lyon)

        (num_days_spent_frankfurt ?dc - day_count_frankfurt)
        (next_frankfurt_day_count ?dc1 ?dc2 - day_count_frankfurt)

        (num_days_spent_krakow ?dc - day_count_krakow)
        (next_krakow_day_count ?dc1 ?dc2 - day_count_krakow)
    )

    ;; Action to stay in Lyon for one day
    (:action stay_in_lyon
        :parameters (?d_curr ?d_next - day ?dc_curr ?dc_next - day_count_lyon)
        :precondition (and
            (at city_lyon)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (num_days_spent_lyon ?dc_curr)
            (next_lyon_day_count ?dc_curr ?dc_next)
            ;; Ensure this day is not used for travel or staying in another city
            (not (travelled_on ?d_curr))
            (not (stayed_in city_frankfurt ?d_curr))
            (not (stayed_in city_krakow ?d_curr))
        )
        :effect (and
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (stayed_in city_lyon ?d_curr)
            (not (num_days_spent_lyon ?dc_curr))
            (num_days_spent_lyon ?dc_next)
        )
    )

    ;; Action to stay in Frankfurt for one day
    (:action stay_in_frankfurt
        :parameters (?d_curr ?d_next - day ?dc_curr ?dc_next - day_count_frankfurt)
        :precondition (and
            (at city_frankfurt)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (num_days_spent_frankfurt ?dc_curr)
            (next_frankfurt_day_count ?dc_curr ?dc_next)
            ;; Ensure this day is not used for travel or staying in another city
            (not (travelled_on ?d_curr))
            (not (stayed_in city_lyon ?d_curr))
            (not (stayed_in city_krakow ?d_curr))
        )
        :effect (and
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (stayed_in city_frankfurt ?d_curr)
            (not (num_days_spent_frankfurt ?dc_curr))
            (num_days_spent_frankfurt ?dc_next)
        )
    )

    ;; Action to stay in Krakow for one day
    (:action stay_in_krakow
        :parameters (?d_curr ?d_next - day ?dc_curr ?dc_next - day_count_krakow)
        :precondition (and
            (at city_krakow)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (num_days_spent_krakow ?dc_curr)
            (next_krakow_day_count ?dc_curr ?dc_next)
            ;; Ensure this day is not used for travel or staying in another city
            (not (travelled_on ?d_curr))
            (not (stayed_in city_lyon ?d_curr))
            (not (stayed_in city_frankfurt ?d_curr))
        )
        :effect (and
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (stayed_in city_krakow ?d_curr)
            (not (num_days_spent_krakow ?dc_curr))
            (num_days_spent_krakow ?dc_next)
        )
    )

    ;; Action to travel between two cities, consuming one day
    (:action travel
        :parameters (?c_from ?c_to - city ?d_curr ?d_next - day)
        :precondition (and
            (at ?c_from)
            (not (at ?c_to)) ; Ensure agent is not already at destination
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (is_flight_connected ?c_from ?c_to)
            ;; Ensure this day is not used for staying in any city or another travel
            (not (stayed_in city_lyon ?d_curr))
            (not (stayed_in city_frankfurt ?d_curr))
            (not (stayed_in city_krakow ?d_curr))
            (not (travelled_on ?d_curr))
        )
        :effect (and
            (not (at ?c_from))
            (at ?c_to)
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (travelled_on ?d_curr)
        )
    )