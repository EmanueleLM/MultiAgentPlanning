(define (domain trip-planning)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        traveler
        location
        time_point
        day_count_ist
        day_count_tal
        day_count_zur
    )
    (:predicates
        (is_at ?p - traveler ?l - location)
        (current_time ?t - time_point)
        (next_time ?t1 - time_point ?t2 - time_point)
        (has_direct_flight ?l1 - location ?l2 - location)

        (ist_days_spent ?n - day_count_ist)
        (next_ist_day_count ?n1 - day_count_ist ?n2 - day_count_ist)

        (tal_days_spent ?n - day_count_tal)
        (next_tal_day_count ?n1 - day_count_tal ?n2 - day_count_tal)

        (zur_days_spent ?n - day_count_zur)
        (next_zur_day_count ?n1 - day_count_zur ?n2 - day_count_zur)

        (show_is_happening ?t - time_point)
        (has_attended_zurich_show)

        (is_istanbul ?l - location)
        (is_tallinn ?l - location)
        (is_zurich ?l - location)
    )

    (:functions (total-cost))

    (:action take_flight
        :parameters (?p - traveler ?from - location ?to - location ?current_t - time_point ?next_t - time_point)
        :precondition (and
            (is_at ?p ?from)
            (has_direct_flight ?from ?to)
            (current_time ?current_t)
            (next_time ?current_t ?next_t)
        )
        :effect (and
            (not (is_at ?p ?from))
            (is_at ?p ?to)
            (not (current_time ?current_t))
            (current_time ?next_t)
            (increase (total-cost) 1)
        )
    )

    (:action spend_day_in_istanbul
        :parameters (?p - traveler ?l_ist - location ?current_t - time_point ?next_t - time_point ?current_n - day_count_ist ?next_n - day_count_ist)
        :precondition (and
            (is_at ?p ?l_ist)
            (is_istanbul ?l_ist)
            (current_time ?current_t)
            (next_time ?current_t ?next_t)
            (ist_days_spent ?current_n)
            (next_ist_day_count ?current_n ?next_n)
        )
        :effect (and
            (not (current_time ?current_t))
            (current_time ?next_t)
            (not (ist_days_spent ?current_n))
            (ist_days_spent ?next_n)
            (increase (total-cost) 1)
        )
    )

    (:action spend_day_in_tallinn
        :parameters (?p - traveler ?l_tal - location ?current_t - time_point ?next_t - time_point ?current_n - day_count_tal ?next_n - day_count_tal)
        :precondition (and
            (is_at ?p ?l_tal)
            (is_tallinn ?l_tal)
            (current_time ?current_t)
            (next_time ?current_t ?next_t)
            (tal_days_spent ?current_n)
            (next_tal_day_count ?current_n ?next_n)
        )
        :effect (and
            (not (current_time ?current_t))
            (current_time ?next_t)
            (not (tal_days_spent ?current_n))
            (tal_days_spent ?next_n)
            (increase (total-cost) 1)
        )
    )

    (:action spend_day_in_zurich_and_attend_show
        :parameters (?p - traveler ?l_zur - location ?current_t - time_point ?next_t - time_point ?current_n - day_count_zur ?next_n - day_count_zur)
        :precondition (and
            (is_at ?p ?l_zur)
            (is_zurich ?l_zur)
            (current_time ?current_t)
            (next_time ?current_t ?next_t)
            (zur_days_spent ?current_n)
            (next_zur_day_count ?current_n ?next_n)
            (show_is_happening ?current_t)
            (not (has_attended_zurich_show))
        )
        :effect (and
            (not (current_time ?current_t))
            (current_time ?next_t)
            (not (zur_days_spent ?current_n))
            (zur_days_spent ?next_n)
            (has_attended_zurich_show)
            (increase (total-cost) 1)
        )
    )

    (:action spend_day_in_zurich_no_show
        :parameters (?p - traveler ?l_zur - location ?current_t - time_point ?next_t - time_point ?current_n - day_count_zur ?next_n - day_count_zur)
        :precondition (and
            (is_at ?p ?l_zur)
            (is_zurich ?l_zur)
            (current_time ?current_t)
            (next_time ?current_t ?next_t)
            (zur_days_spent ?current_n)
            (next_zur_day_count ?current_n ?next_n)
            (or (not (show_is_happening ?current_t)) (has_attended_zurich_show))
        )
        :effect (and
            (not (current_time ?current_t))
            (current_time ?next_t)
            (not (zur_days_spent ?current_n))
            (zur_days_spent ?next_n)
            (increase (total-cost) 1)
        )
    )
)