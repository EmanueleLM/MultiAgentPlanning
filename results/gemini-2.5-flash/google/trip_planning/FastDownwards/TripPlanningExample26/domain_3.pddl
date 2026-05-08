(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        time_point
        day_counter
    )
    (:predicates
        (at ?c - city)
        (connected ?c1 - city ?c2 - city)
        (current_time ?t - time_point)
        (next_time ?t1 - time_point ?t2 - time_point)

        ; Stay counters for each city
        (porto_stay_days ?n - day_counter)
        (berlin_stay_days ?n - day_counter)
        (reykjavik_stay_days ?n - day_counter)
        (next_day_count ?n1 - day_counter ?n2 - day_counter)

        ; Friend meeting predicate
        (met_friend)
        (meeting_window ?t - time_point) ; True for time points t12 to t16 inclusive
    )

    (:action travel
        :parameters (?from - city ?to - city)
        :precondition (and
            (at ?from)
            (connected ?from ?to)
        )
        :effect (and
            (not (at ?from))
            (at ?to)
        )
    )

    (:action spend_day_in_porto
        :parameters (?t_curr - time_point ?t_next - time_point ?dc_curr - day_counter ?dc_next - day_counter)
        :precondition (and
            (at porto)
            (current_time ?t_curr)
            (next_time ?t_curr ?t_next)
            (porto_stay_days ?dc_curr)
            (next_day_count ?dc_curr ?dc_next)
            ; Ensure we don't exceed the reconciled target of 6 days for Porto (i.e., prevent reaching d7)
            (not (porto_stay_days d7))
        )
        :effect (and
            (not (current_time ?t_curr))
            (current_time ?t_next)
            (not (porto_stay_days ?dc_curr))
            (porto_stay_days ?dc_next)
        )
    )

    (:action spend_day_in_berlin
        :parameters (?t_curr - time_point ?t_next - time_point ?dc_curr - day_counter ?dc_next - day_counter)
        :precondition (and
            (at berlin)
            (current_time ?t_curr)
            (next_time ?t_curr ?t_next)
            (berlin_stay_days ?dc_curr)
            (next_day_count ?dc_curr ?dc_next)
            ; Ensure we don't exceed the reconciled target of 5 days for Berlin (i.e., prevent reaching d6)
            (not (berlin_stay_days d6))
        )
        :effect (and
            (not (current_time ?t_curr))
            (current_time ?t_next)
            (not (berlin_stay_days ?dc_curr))
            (berlin_stay_days ?dc_next)
        )
    )

    (:action spend_day_in_reykjavik
        :parameters (?t_curr - time_point ?t_next - time_point ?dc_curr - day_counter ?dc_next - day_counter)
        :precondition (and
            (at reykjavik)
            (current_time ?t_curr)
            (next_time ?t_curr ?t_next)
            (reykjavik_stay_days ?dc_curr)
            (next_day_count ?dc_curr ?dc_next)
            ; Ensure we don't exceed the reconciled target of 5 days for Reykjavik (i.e., prevent reaching d6)
            (not (reykjavik_stay_days d6))
        )
        :effect (and
            (not (current_time ?t_curr))
            (current_time ?t_next)
            (not (reykjavik_stay_days ?dc_curr))
            (reykjavik_stay_days ?dc_next)
        )
    )

    (:action meet_friend
        :parameters (?t - time_point)
        :precondition (and
            (at reykjavik)
            (current_time ?t)
            (meeting_window ?t)
            (not (met_friend))
        )
        :effect (and
            (met_friend)
        )
    )
)