(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types city day count)
    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (stay_counted ?c - city ?d - day)
        (next_day ?d1 ?d2 - day)
        (next_val ?v1 ?v2 - count)
        (count ?c - city ?v - count)
        (connected ?c1 ?c2 - city)
        (started)
        (friend_at_reykjavik ?d - day)
        (friend_met)
    )

    (:action start_trip
        :parameters (?c - city)
        :precondition (not (started))
        :effect (and (started) (at ?c))
    )

    (:action count_stay
        :parameters (?c - city ?d - day ?v_old - count ?v_new - count)
        :precondition (and (at ?c) (current_day ?d) (count ?c ?v_old) (next_val ?v_old ?v_new) (not (stay_counted ?c ?d)))
        :effect (and (not (count ?c ?v_old)) (count ?c ?v_new) (stay_counted ?c ?d))
    )

    (:action fly
        :parameters (?from - city ?to - city ?d - day)
        :precondition (and (at ?from) (current_day ?d) (connected ?from ?to))
        :effect (and (not (at ?from)) (at ?to))
    )

    (:action advance_day
        :parameters (?d - day ?next - day)
        :precondition (and (current_day ?d) (next_day ?d ?next))
        :effect (and (not (current_day ?d)) (current_day ?next))
    )

    (:action meet_friend
        :parameters (?d - day)
        :precondition (and (at reykjavik) (current_day ?d) (friend_at_reykjavik ?d))
        :effect (friend_met)
    )
)