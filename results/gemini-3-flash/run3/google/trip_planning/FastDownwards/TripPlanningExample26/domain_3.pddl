(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types city day count_val)
    (:predicates
        (at_city ?c - city)
        (at_day ?d - day)
        (visited_count ?c - city ?v - count_val)
        (stay_recorded ?c - city ?d - day)
        (next_day ?d1 ?d2 - day)
        (next_count ?v1 ?v2 - count_val)
        (connected ?c1 ?c2 - city)
        (friend_met)
        (is_reykjavik ?c - city)
        (friend_window ?d - day)
        (started)
    )

    (:action start_trip
        :parameters (?c - city)
        :precondition (not (started))
        :effect (and 
            (started) 
            (at_city ?c)
        )
    )

    (:action count_stay
        :parameters (?c - city ?d - day ?v_old - count_val ?v_new - count_val)
        :precondition (and 
            (at_city ?c) 
            (at_day ?d) 
            (visited_count ?c ?v_old) 
            (next_count ?v_old ?v_new) 
            (not (stay_recorded ?c ?d))
        )
        :effect (and 
            (not (visited_count ?c ?v_old)) 
            (visited_count ?c ?v_new) 
            (stay_recorded ?c ?d)
        )
    )

    (:action fly
        :parameters (?from - city ?to - city ?d - day)
        :precondition (and 
            (at_city ?from) 
            (at_day ?d) 
            (connected ?from ?to)
        )
        :effect (and 
            (not (at_city ?from)) 
            (at_city ?to)
        )
    )

    (:action advance_day
        :parameters (?d_old - day ?d_new - day)
        :precondition (and 
            (at_day ?d_old) 
            (next_day ?d_old ?d_new)
        )
        :effect (and 
            (not (at_day ?d_old)) 
            (at_day ?d_new)
        )
    )

    (:action meet_friend
        :parameters (?c - city ?d - day)
        :precondition (and 
            (at_city ?c) 
            (is_reykjavik ?c) 
            (at_day ?d) 
            (friend_window ?d)
        )
        :effect (friend_met)
    )
)