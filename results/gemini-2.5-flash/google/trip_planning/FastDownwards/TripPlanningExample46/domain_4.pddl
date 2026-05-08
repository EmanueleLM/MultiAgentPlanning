(define (domain trip_planning_example46)
    (:requirements :strips :typing :negative-preconditions)
    (:types city day stay_count_marker conference_count_marker)
    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (next_day ?d1 ?d2 - day)
        (direct_flight ?c1 ?c2 - city)
        (seville_days_stayed ?s - stay_count_marker)
        (manchester_days_stayed ?s - stay_count_marker)
        (stockholm_days_stayed ?c - conference_count_marker)
        (next_stay_marker ?s1 ?s2 - stay_count_marker)
        (next_conference_marker ?c1 ?c2 - conference_count_marker)
        (conference_day ?d - day)
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
        :parameters (?d_curr - day ?d_next - day ?s_curr - stay_count_marker ?s_next - stay_count_marker)
        :precondition (and
            (at seville)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (seville_days_stayed ?s_curr)
            (next_stay_marker ?s_curr ?s_next)
        )
        :effect (and
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (not (seville_days_stayed ?s_curr))
            (seville_days_stayed ?s_next)
        )
    )

    (:action stay_in_manchester_day_advance
        :parameters (?d_curr - day ?d_next - day ?s_curr - stay_count_marker ?s_next - stay_count_marker)
        :precondition (and
            (at manchester)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (manchester_days_stayed ?s_curr)
            (next_stay_marker ?s_curr ?s_next)
        )
        :effect (and
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (not (manchester_days_stayed ?s_curr))
            (manchester_days_stayed ?s_next)
        )
    )

    (:action stay_in_stockholm_day_advance
        :parameters (?d_curr - day ?d_next - day ?c_curr - conference_count_marker ?c_next - conference_count_marker)
        :precondition (and
            (at stockholm)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (stockholm_days_stayed ?c_curr)
            (next_conference_marker ?c_curr ?c_next)
            (not (conference_day ?d_curr))
        )
        :effect (and
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (not (stockholm_days_stayed ?c_curr))
            (stockholm_days_stayed ?c_next)
        )
    )

    (:action attend_conference_stockholm_d01_day_advance
        :parameters (?d_next - day ?c_curr - conference_count_marker ?c_next - conference_count_marker)
        :precondition (and
            (at stockholm)
            (current_day d01)
            (next_day d01 ?d_next)
            (stockholm_days_stayed ?c_curr)
            (next_conference_marker ?c_curr ?c_next)
            (not (conference_d01_attended))
        )
        :effect (and
            (not (current_day d01))
            (current_day ?d_next)
            (not (stockholm_days_stayed ?c_curr))
            (stockholm_days_stayed ?c_next)
            (conference_d01_attended)
        )
    )

    (:action attend_conference_stockholm_d03_day_advance
        :parameters (?d_next - day ?c_curr - conference_count_marker ?c_next - conference_count_marker)
        :precondition (and
            (at stockholm)
            (current_day d03)
            (next_day d03 ?d_next)
            (stockholm_days_stayed ?c_curr)
            (next_conference_marker ?c_curr ?c_next)
            (not (conference_d03_attended))
        )
        :effect (and
            (not (current_day d03))
            (current_day ?d_next)
            (not (stockholm_days_stayed ?c_curr))
            (stockholm_days_stayed ?c_next)
            (conference_d03_attended)
        )
    )
)