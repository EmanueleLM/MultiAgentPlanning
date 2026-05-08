(define (domain trip-planning-example32)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        rk_day_count
        riga_day_count
        paris_day_count
    )
    (:constants
        paris reykjavik riga - city
    )
    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (connected ?c1 - city ?c2 - city)
        (days_in_rk ?rdc - rk_day_count)
        (next_rk_count ?curr ?next - rk_day_count)
        (days_in_riga ?rgc - riga_day_count)
        (next_riga_count ?curr ?next - riga_day_count)
        (days_in_paris ?rpc - paris_day_count)
        (next_paris_count ?curr ?next - paris_day_count)
        (is_in_rk_on_day ?d - day)
        (is_show_day ?d - day)
    )

    (:action spend_day_in_reykjavik
        :parameters (?d_curr - day ?d_next - day
                     ?rd_curr - rk_day_count ?rd_next - rk_day_count)
        :precondition (and
            (at reykjavik)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (days_in_rk ?rd_curr)
            (next_rk_count ?rd_curr ?rd_next)
        )
        :effect (and
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (not (days_in_rk ?rd_curr))
            (days_in_rk ?rd_next)
            (is_in_rk_on_day ?d_curr)
        )
    )

    (:action spend_day_in_riga
        :parameters (?d_curr - day ?d_next - day
                     ?rg_curr - riga_day_count ?rg_next - riga_day_count)
        :precondition (and
            (at riga)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (days_in_riga ?rg_curr)
            (next_riga_count ?rg_curr ?rg_next)
            (not (is_show_day ?d_curr))
        )
        :effect (and
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (not (days_in_riga ?rg_curr))
            (days_in_riga ?rg_next)
        )
    )

    (:action spend_day_in_paris
        :parameters (?d_curr - day ?d_next - day
                     ?rp_curr - paris_day_count ?rp_next - paris_day_count)
        :precondition (and
            (at paris)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (days_in_paris ?rp_curr)
            (next_paris_count ?rp_curr ?rp_next)
            (not (is_show_day ?d_curr))
        )
        :effect (and
            (not (current_day ?d_curr))
            (current_day ?d_next)
            (not (days_in_paris ?rp_curr))
            (days_in_paris ?rp_next)
        )
    )

    (:action travel
        :parameters (?from_c - city ?to_c - city
                     ?d_curr - day ?d_next - day)
        :precondition (and
            (at ?from_c)
            (current_day ?d_curr)
            (next_day ?d_curr ?d_next)
            (connected ?from_c ?to_c)
            (not (is_show_day ?d_curr))
        )
        :effect (and
            (not (at ?from_c))
            (at ?to_c)
            (not (current_day ?d_curr))
            (current_day ?d_next)
        )
    )
)