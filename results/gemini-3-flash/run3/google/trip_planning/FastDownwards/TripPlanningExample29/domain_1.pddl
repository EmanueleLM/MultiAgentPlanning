(define (domain trip_planning_example_29)
    (:requirements :strips :typing :negative-preconditions)
    (:types city day count)
    (:predicates
        (at ?c - city ?d - day)
        (was_at ?c - city ?d - day)
        (city_count ?c - city ?co - count)
        (next_day ?d1 - day ?d2 - day)
        (next_count ?co1 - count ?co2 - count)
        (can_fly ?c1 - city ?c2 - city)
    )

    ;; Stay in the same city from one day to the next.
    ;; This increments the city's visit count by 1.
    (:action stay
        :parameters (?c - city ?d_curr - day ?d_next - day ?c_curr - count ?c_next - count)
        :precondition (and 
            (at ?c ?d_curr) 
            (next_day ?d_curr ?d_next) 
            (city_count ?c ?c_curr) 
            (next_count ?c_curr ?c_next)
        )
        :effect (and 
            (not (at ?c ?d_curr)) 
            (at ?c ?d_next) 
            (was_at ?c ?d_next)
            (not (city_count ?c ?c_curr)) 
            (city_count ?c ?c_next)
        )
    )

    ;; Fly from one city to another from one day to the next.
    ;; This counts as spending time in BOTH the origin and destination cities on the arrival day.
    ;; This increments the counts for both cities by 1.
    (:action fly
        :parameters (?c_from - city ?c_to - city ?d_curr - day ?d_next - day ?cf_curr - count ?cf_next - count ?ct_curr - count ?ct_next - count)
        :precondition (and 
            (at ?c_from ?d_curr) 
            (next_day ?d_curr ?d_next) 
            (can_fly ?c_from ?c_to) 
            (city_count ?c_from ?cf_curr) 
            (next_count ?cf_curr ?cf_next) 
            (city_count ?c_to ?ct_curr) 
            (next_count ?ct_curr ?ct_next)
        )
        :effect (and 
            (not (at ?c_from ?d_curr)) 
            (at ?c_to ?d_next) 
            (was_at ?c_from ?d_next) 
            (was_at ?c_to ?d_next)
            (not (city_count ?c_from ?cf_curr)) 
            (city_count ?c_from ?cf_next) 
            (not (city_count ?c_to ?ct_curr)) 
            (city_count ?c_to ?ct_next)
        )
    )
)