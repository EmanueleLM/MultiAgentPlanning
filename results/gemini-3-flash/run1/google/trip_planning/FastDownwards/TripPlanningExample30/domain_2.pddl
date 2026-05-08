(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types city day count)
    (:constants istanbul tallinn zurich - city)
    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (city_count ?c - city ?n - count)
        (next_day ?d1 ?d2 - day)
        (next_count ?n1 ?n2 - count)
        (can_fly ?c1 ?c2 - city)
        (is_show_day ?d - day)
        (attended_show)
        (has_flown ?d - day)
    )

    ;; Stay in the current city and move to the next day, incrementing its stay count
    (:action stay
        :parameters (?c - city ?d_curr - day ?d_next - day ?count_curr - count ?count_next - count)
        :precondition (and 
            (at ?c) 
            (current_day ?d_curr) 
            (next_day ?d_curr ?d_next) 
            (city_count ?c ?count_curr) 
            (next_count ?count_curr ?count_next)
        )
        :effect (and 
            (current_day ?d_next) 
            (city_count ?c ?count_next) 
            (not (current_day ?d_curr)) 
            (not (city_count ?c ?count_curr))
        )
    )

    ;; Fly to a new city on the same calendar day, starting its count from the next increment
    (:action fly
        :parameters (?from - city ?to - city ?d - day ?count_to_curr - count ?count_to_next - count)
        :precondition (and 
            (at ?from) 
            (current_day ?d) 
            (not (has_flown ?d))
            (can_fly ?from ?to) 
            (city_count ?to ?count_to_curr) 
            (next_count ?count_to_curr ?count_to_next)
        )
        :effect (and 
            (at ?to) 
            (has_flown ?d)
            (city_count ?to ?count_to_next) 
            (not (at ?from)) 
            (not (city_count ?to ?count_to_curr))
        )
    )

    ;; Attend the annual show in Zurich
    (:action attend_show
        :parameters (?d - day)
        :precondition (and 
            (at zurich) 
            (current_day ?d) 
            (is_show_day ?d)
        )
        :effect (attended_show)
    )
)