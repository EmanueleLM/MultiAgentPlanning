(define (domain trip_planning_example_14)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        day_count_lyon ; Tracks days spent in Lyon
        day_count_frankfurt ; Tracks days spent in Frankfurt
        day_count_krakow ; Tracks days spent in Krakow
    )
    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (next_day ?d1 ?d2 - day)
        (is_flight_connected ?c1 ?c2 - city)
        (stayed_in ?c - city ?d - day) ; Records that agent stayed in city C on day D
        (travelled_on ?d - day) ; Records that agent travelled on day D

        ; Predicates to track days spent in Lyon (goal: 3 days)
        (num_days_spent_lyon ?dc - day_count_lyon)
        (next_lyon_day_count ?dc1 ?dc2 - day_count_lyon)

        ; Predicates to track days spent in Frankfurt (goal: 2 days)
        (num_days_spent_frankfurt ?dc - day_count_frankfurt)
        (next_frankfurt_day_count ?dc1 ?dc2 - day_count_frankfurt)

        ; Predicates to track days spent in Krakow (goal: 3 days)
        (num_days_spent_krakow ?dc - day_count_krakow)
        (next_krakow_day_count ?dc1 ?dc2 - day_count_krakow)
    )

    ;; Action to stay in Lyon for one day
    (:action stay_in_lyon ; Fixed: Enclosed action definition with (:action ...)
        :parameters (?d_curr ?d_next - day ?dc_curr ?dc_next - day_count_lyon)
        :precondition (and
            (at lyon)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (num_days_spent_lyon ?dc_curr)
            (next_lyon_day_count ?dc_curr ?dc_next)
        )
        :effect (and
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (stayed_in lyon ?d_curr)
            (not (num_days_spent_lyon ?dc_curr))
            (num_days_spent_lyon ?dc_next)
        )
    )

    ;; Action to stay in Frankfurt for one day
    (:action stay_in_frankfurt ; Fixed: Enclosed action definition with (:action ...)
        :parameters (?d_curr ?d_next - day ?dc_curr ?dc_next - day_count_frankfurt)
        :precondition (and
            (at frankfurt)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (num_days_spent_frankfurt ?dc_curr)
            (next_frankfurt_day_count ?dc_curr ?dc_next)
        )
        :effect (and
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (stayed_in frankfurt ?d_curr)
            (not (num_days_spent_frankfurt ?dc_curr))
            (num_days_spent_frankfurt ?dc_next)
        )
    )

    ;; Action to stay in Krakow for one day
    (:action stay_in_krakow ; Fixed: Enclosed action definition with (:action ...)
        :parameters (?d_curr ?d_next - day ?dc_curr ?dc_next - day_count_krakow)
        :precondition (and
            (at krakow)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (num_days_spent_krakow ?dc_curr)
            (next_krakow_day_count ?dc_curr ?dc_next)
        )
        :effect (and
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (stayed_in krakow ?d_curr)
            (not (num_days_spent_krakow ?dc_curr))
            (num_days_spent_krakow ?dc_next)
        )
    )

    ;; Action to travel between two cities, consuming one day
    (:action travel ; Fixed: Enclosed action definition with (:action ...)
        :parameters (?c_from ?c_to - city ?d_curr ?d_next - day)
        :precondition (and
            (at ?c_from)
            (not (at ?c_to)) ; Ensure agent is not already at destination
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (is_flight_connected ?c_from ?c_to)
        )
        :effect (and
            (not (at ?c_from))
            (at ?c_to)
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (travelled_on ?d_curr)
        )
    )
)