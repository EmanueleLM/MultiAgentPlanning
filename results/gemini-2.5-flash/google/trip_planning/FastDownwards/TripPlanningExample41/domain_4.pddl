(define (domain trip_planning_example41)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        day
        day_counter_s
        day_counter_a
        day_counter_m
    )
    (:predicates
        (at_city ?c - city)
        (current_day ?d - day)
        (next_day ?d1 - day ?d2 - day)
        (direct_flight ?c1 - city ?c2 - city)
        (conference_on_day ?d - day)
        (conference_city ?d - day ?c - city)
        (stockholm_days_spent ?n - day_counter_s)
        (athens_days_spent ?n - day_counter_a)
        (mykonos_days_spent ?n - day_counter_m)
        (next_s_count ?n1 - day_counter_s ?n2 - day_counter_s)
        (next_a_count ?n1 - day_counter_a ?n2 - day_counter_a)
        (next_m_count ?n1 - day_counter_m ?n2 - day_counter_m)
    )

    (:action stay_in_stockholm
        :parameters (?d - day ?next_d - day ?curr_s - day_counter_s ?next_s - day_counter_s)
        :precondition
            (and
                (current_day ?d)
                (at_city stockholm)
                (next_day ?d ?next_d)
                (stockholm_days_spent ?curr_s)
                (next_s_count ?curr_s ?next_s)
            )
        :effect
            (and
                (not (current_day ?d))
                (current_day ?next_d)
                (not (stockholm_days_spent ?curr_s))
                (stockholm_days_spent ?next_s)
            )
    )

    (:action stay_in_athens
        :parameters (?d - day ?next_d - day ?curr_a - day_counter_a ?next_a - day_counter_a)
        :precondition
            (and
                (current_day ?d)
                (at_city athens)
                (next_day ?d ?next_d)
                (athens_days_spent ?curr_a)
                (next_a_count ?curr_a ?next_a)
                (not (conference_on_day ?d))
            )
        :effect
            (and
                (not (current_day ?d))
                (current_day ?next_d)
                (not (athens_days_spent ?curr_a))
                (athens_days_spent ?next_a)
            )
    )

    (:action stay_in_mykonos
        :parameters (?d - day ?next_d - day ?curr_m - day_counter_m ?next_m - day_counter_m)
        :precondition
            (and
                (current_day ?d)
                (at_city mykonos)
                (next_day ?d ?next_d)
                (mykonos_days_spent ?curr_m)
                (next_m_count ?curr_m ?next_m)
                (not (conference_on_day ?d))
            )
        :effect
            (and
                (not (current_day ?d))
                (current_day ?next_d)
                (not (mykonos_days_spent ?curr_m))
                (mykonos_days_spent ?next_m)
            )
    )

    (:action fly_stockholm_to_athens
        :parameters (?d - day ?next_d - day ?curr_s - day_counter_s ?next_s - day_counter_s)
        :precondition
            (and
                (current_day ?d)
                (at_city stockholm)
                (direct_flight stockholm athens)
                (next_day ?d ?next_d)
                (not (conference_on_day ?d))
                (stockholm_days_spent ?curr_s)
                (next_s_count ?curr_s ?next_s)
            )
        :effect
            (and
                (not (current_day ?d))
                (current_day ?next_d)
                (not (at_city stockholm))
                (at_city athens)
                (not (stockholm_days_spent ?curr_s))
                (stockholm_days_spent ?next_s)
            )
    )

    (:action fly_athens_to_stockholm
        :parameters (?d - day ?next_d - day ?curr_a - day_counter_a ?next_a - day_counter_a)
        :precondition
            (and
                (current_day ?d)
                (at_city athens)
                (direct_flight athens stockholm)
                (next_day ?d ?next_d)
                (not (conference_on_day ?d))
                (athens_days_spent ?curr_a)
                (next_a_count ?curr_a ?next_a)
            )
        :effect
            (and
                (not (current_day ?d))
                (current_day ?next_d)
                (not (at_city athens))
                (at_city stockholm)
                (not (athens_days_spent ?curr_a))
                (athens_days_spent ?next_a)
            )
    )

    (:action fly_athens_to_mykonos
        :parameters (?d - day ?next_d - day ?curr_a - day_counter_a ?next_a - day_counter_a)
        :precondition
            (and
                (current_day ?d)
                (at_city athens)
                (direct_flight athens mykonos)
                (next_day ?d ?next_d)
                (not (conference_on_day ?d))
                (athens_days_spent ?curr_a)
                (next_a_count ?curr_a ?next_a)
            )
        :effect
            (and
                (not (current_day ?d))
                (current_day ?next_d)
                (not (at_city athens))
                (at_city mykonos)
                (not (athens_days_spent ?curr_a))
                (athens_days_spent ?next_a)
            )
    )

    (:action fly_mykonos_to_athens
        :parameters (?d - day ?next_d - day ?curr_m - day_counter_m ?next_m - day_counter_m)
        :precondition
            (and
                (current_day ?d)
                (at_city mykonos)
                (direct_flight mykonos athens)
                (next_day ?d ?next_d)
                (not (conference_on_day ?d))
                (mykonos_days_spent ?curr_m)
                (next_m_count ?curr_m ?next_m)
            )
        :effect
            (and
                (not (current_day ?d))
                (current_day ?next_d)
                (not (at_city mykonos))
                (at_city athens)
                (not (mykonos_days_spent ?curr_m))
                (mykonos_days_spent ?next_m)
            )
    )
)