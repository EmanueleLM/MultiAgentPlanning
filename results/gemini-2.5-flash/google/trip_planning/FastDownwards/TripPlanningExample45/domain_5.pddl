(define (domain trip_planning_domain)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        person
        city
        day_stage
        day_count_state
    )
    (:predicates
        (at ?p - person ?c - city)
        (current_day_stage ?d - day_stage)
        (next_day_stage ?d1 - day_stage ?d2 - day_stage)
        (direct_flight ?c1 - city ?c2 - city)
        (days_spent_in_city ?p - person ?c - city ?dcs - day_count_state)
        (next_count_state ?dcs1 - day_count_state ?dcs2 - day_count_state)
        (conference_day_at ?d - day_stage ?c - city)
    )
    (:functions
        (total-cost)
    )

    (:action travel
        :parameters (?p - person ?from ?to - city ?current_d ?next_d - day_stage ?copenhagen_obj - city)
        :precondition (and
            (at ?p ?from)
            (direct_flight ?from ?to)
            (current_day_stage ?current_d)
            (next_day_stage ?current_d ?next_d)
            (= ?copenhagen_obj copenhagen) ; Explicitly bind the variable to the object constant
            ; If the next day is a conference day in Copenhagen, we must travel to Copenhagen.
            ; Thus, if (conference_day_at ?next_d copenhagen) is true, then ?to must be copenhagen.
            (or (not (conference_day_at ?next_d ?copenhagen_obj)) (= ?to ?copenhagen_obj))
        )
        :effect (and
            (not (at ?p ?from))
            (at ?p ?to)
            (not (current_day_stage ?current_d))
            (current_day_stage ?next_d)
            (increase (total-cost) 1)
        )
    )

    (:action stay
        :parameters (?p - person ?c - city ?current_d ?next_d - day_stage ?current_count ?next_count - day_count_state ?copenhagen_obj - city)
        :precondition (and
            (at ?p ?c)
            (current_day_stage ?current_d)
            (next_day_stage ?current_d ?next_d)
            (days_spent_in_city ?p ?c ?current_count)
            (next_count_state ?current_count ?next_count)
            (= ?copenhagen_obj copenhagen) ; Explicitly bind the variable to the object constant
            ; If the next day is a conference day in Copenhagen, we must be in Copenhagen.
            ; Thus, if (conference_day_at ?next_d copenhagen) is true, then ?c must be copenhagen.
            (or (not (conference_day_at ?next_d ?copenhagen_obj)) (= ?c ?copenhagen_obj))
        )
        :effect (and
            (not (current_day_stage ?current_d))
            (current_day_stage ?next_d)
            (not (days_spent_in_city ?p ?c ?current_count))
            (days_spent_in_city ?p ?c ?next_count)
            (increase (total-cost) 1)
        )
    )
)