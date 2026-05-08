(define (domain trip_planning_example_46)
    (:requirements :strips :typing :negative-preconditions)
    (:types city day count)
    (:predicates
        (at ?c - city ?d - day)
        (stay_count ?c - city ?n - count)
        (fly_route ?c1 - city ?c2 - city)
        (next_day ?d1 - day ?d2 - day)
        (next_count ?n1 - count ?n2 - count)
        (can_fly_today)
        (attended_conf ?d - day)
    )

    (:action advance_day
        :parameters (?c - city ?d_now - day ?d_next - day ?s_now - count ?s_next - count)
        :precondition (and 
            (at ?c ?d_now) 
            (next_day ?d_now ?d_next) 
            (stay_count ?c ?s_now) 
            (next_count ?s_now ?s_next)
        )
        :effect (and 
            (not (at ?c ?d_now)) 
            (at ?c ?d_next) 
            (not (stay_count ?c ?s_now)) 
            (stay_count ?c ?s_next) 
            (can_fly_today)
        )
    )

    (:action fly
        :parameters (?c_from - city ?c_to - city ?d - day ?s_now - count ?s_next - count)
        :precondition (and 
            (at ?c_from ?d) 
            (fly_route ?c_from ?c_to) 
            (can_fly_today) 
            (stay_count ?c_to ?s_now) 
            (next_count ?s_now ?s_next)
        )
        :effect (and 
            (not (at ?c_from ?d)) 
            (at ?c_to ?d) 
            (not (stay_count ?c_to ?s_now)) 
            (stay_count ?c_to ?s_next) 
            (not (can_fly_today))
        )
    )

    (:action attend_conference
        :parameters (?d - day)
        :precondition (at stockholm ?d)
        :effect (attended_conf ?d)
    )
)