(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types city day step)
    (:predicates
        (at_city ?c - city ?d - day)
        (visited ?c - city ?d - day)
        (tallied ?c - city ?d - day)
        (day_done ?d - day)
        (can_fly ?c1 ?c2 - city)
        (next_day ?d1 ?d2 - day)
        (next_step ?s1 ?s2 - step)
        (count_frankfurt ?s - step)
        (count_bucharest ?s - step)
        (count_stuttgart ?s - step)
        (not_started)
        (is_day_1 ?d - day)
    )

    (:action start_trip
        :parameters (?c - city ?d - day)
        :precondition (and (not_started) (is_day_1 ?d))
        :effect (and (at_city ?c ?d) (not (not_started)))
    )

    (:action stay
        :parameters (?c - city ?d - day)
        :precondition (and (at_city ?c ?d) (not (day_done ?d)))
        :effect (and (visited ?c ?d) (day_done ?d))
    )

    (:action fly
        :parameters (?from - city ?to - city ?d - day)
        :precondition (and (at_city ?from ?d) (can_fly ?from ?to) (not (day_done ?d)))
        :effect (and (not (at_city ?from ?d)) (at_city ?to ?d) (visited ?from ?d) (visited ?to ?d) (day_done ?d))
    )

    (:action advance_day
        :parameters (?c - city ?d1 ?d2 - day)
        :precondition (and (at_city ?c ?d1) (day_done ?d1) (next_day ?d1 ?d2))
        :effect (and (not (at_city ?c ?d1)) (at_city ?c ?d2))
    )

    (:action tally_frankfurt
        :parameters (?d - day ?s1 ?s2 - step)
        :precondition (and (visited frankfurt ?d) (not (tallied frankfurt ?d)) (count_frankfurt ?s1) (next_step ?s1 ?s2))
        :effect (and (not (count_frankfurt ?s1)) (count_frankfurt ?s2) (tallied frankfurt ?d))
    )

    (:action tally_bucharest
        :parameters (?d - day ?s1 ?s2 - step)
        :precondition (and (visited bucharest ?d) (not (tallied bucharest ?d)) (count_bucharest ?s1) (next_step ?s1 ?s2))
        :effect (and (not (count_bucharest ?s1)) (count_bucharest ?s2) (tallied bucharest ?d))
    )

    (:action tally_stuttgart
        :parameters (?d - day ?s1 ?s2 - step)
        :precondition (and (visited stuttgart ?d) (not (tallied stuttgart ?d)) (count_stuttgart ?s1) (next_step ?s1 ?s2))
        :effect (and (not (count_stuttgart ?s1)) (count_stuttgart ?s2) (tallied stuttgart ?d))
    )
)