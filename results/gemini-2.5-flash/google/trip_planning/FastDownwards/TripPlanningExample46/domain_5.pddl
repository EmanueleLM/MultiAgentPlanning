(define (domain trip_planning_example46)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        city_stay_count_marker
        stockholm_stay_count_marker
    )
    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (next_day ?d1 ?d2 - day)
        (direct_flight ?c1 ?c2 - city)
        (seville_days_stayed ?s - city_stay_count_marker)
        (manchester_days_stayed ?s - city_stay_count_marker)
        (stockholm_days_stayed ?st - stockholm_stay_count_marker)
        (next_city_stay_marker ?s1 ?s2 - city_stay_count_marker)
        (next_stockholm_stay_marker ?st1 ?st2 - stockholm_stay_count_marker)
        (is_conference_day ?d - day)
        (conference_d01_attended)
        (conference_d03_attended)
    )

    (:action travel_flight_day_advance
        :parameters (?from - city ?to - city ?d_curr - day ?d_next - day)
        :precondition (and
            (at ?from)
            (not (at ?to))
            (direct_flight ?from ?to)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
        )
        :effect (and
            (not (at ?from))
            (at ?to)
            (not (current_day ?d_curr))
            (current_day ?d_next)
        )
    )

    (:action stay_in_seville_day_advance
        :parameters (?d_curr - day ?d_next - day ?s_curr - city_stay_count_marker ?s_next - city_stay_count_marker)
        :precondition (and
            (at seville)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (seville_days_stayed ?s_curr)
            (next_city_stay_marker ?s_curr ?s_next)
        )
        :effect (and
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (not (seville_days_stayed ?s_curr))
            (seville_days_stayed ?s_next)
        )
    )

    (:action stay_in_manchester_day_advance
        :parameters (?d_curr - day ?d_next - day ?s_curr - city_stay_count_marker ?s_next - city_stay_count_marker)
        :precondition (and
            (at manchester)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (manchester_days_stayed ?s_curr)
            (next_city_stay_marker ?s_curr ?s_next)
        )
        :effect (and
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (not (manchester_days_stayed ?s_curr))
            (manchester_days_stayed ?s_next)
        )
    )

    (:action stay_in_stockholm_day_advance
        :parameters (?d_curr - day ?d_next - day ?st_curr - stockholm_stay_count_marker ?st_next - stockholm_stay_count_marker)
        :precondition (and
            (at stockholm)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (stockholm_days_stayed ?st_curr)
            (next_stockholm_stay_marker ?st_curr ?st_next)
            (not (is_conference_day ?d_curr))
        )
        :effect (and
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (not (stockholm_days_stayed ?st_curr))
            (stockholm_days_stayed ?st_next)
        )
    )

    (:action attend_conference_stockholm_d01_day_advance
        :parameters (?d_next - day ?st_curr - stockholm_stay_count_marker ?st_next - stockholm_stay_count_marker)
        :precondition (and
            (at stockholm)
            (current_day d01)
            (next_day d01 ?d_next)
            (stockholm_days_stayed ?st_curr)
            (next_stockholm_stay_marker ?st_curr ?st_next)
            (not (conference_d01_attended))
            (is_conference_day d01)
        )
        :effect (and
            (not (current_day d01))
            (current_day ?d_next)
            (not (stockholm_days_stayed ?st_curr))
            (stockholm_days_stayed ?st_next)
            (conference_d01_attended)
        )
    )

    (:action attend_conference_stockholm_d03_day_advance
        :parameters (?d_next - day ?st_curr - stockholm_stay_count_marker ?st_next - stockholm_stay_count_marker)
        :precondition (and
            (at stockholm)
            (current_day d03)
            (next_day d03 ?d_next)
            (stockholm_days_stayed ?st_curr)
            (next_stockholm_stay_marker ?st_curr ?st_next)
            (not (conference_d03_attended))
            (is_conference_day d03)
        )
        :effect (and
            (not (current_day d03))
            (current_day ?d_next)
            (not (stockholm_days_stayed ?st_curr))
            (stockholm_days_stayed ?st_next)
            (conference_d03_attended)
        )
    )
)