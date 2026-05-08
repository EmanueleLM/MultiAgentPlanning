(define (domain trip_planning)
    (:requirements :strips :typing :negative-preconditions)
    (:types city day step)
    (:predicates
        (at_start ?c - city ?d - day)
        (at_end ?c - city ?d - day)
        (visited ?c - city ?d - day)
        (day_done ?d - day)
        (tallied ?c - city ?d - day)
        (next_day ?d1 ?d2 - day)
        (next_step ?s1 ?s2 - step)
        (frankfurt_count ?s - step)
        (bucharest_count ?s - step)
        (stuttgart_count ?s - step)
        (can_fly ?c1 ?c2 - city)
        (not_started)
    )

    (:action start_trip
        :parameters (?c - city)
        :precondition (not_started)
        :effect (and (at_start ?c d1) (not (not_started)))
    )

    (:action stay
        :parameters (?c - city ?d - day)
        :precondition (at_start ?c ?d)
        :effect (and (at_end ?c ?d) (visited ?c ?d) (day_done ?d))
    )

    (:action fly
        :parameters (?from - city ?to - city ?d - day)
        :precondition (and (at_start ?from ?d) (can_fly ?from ?to))
        :effect (and (at_end ?to ?d) (visited ?from ?d) (visited ?to ?d) (day_done ?d))
    )

    (:action advance_day
        :parameters (?c - city ?d_from - day ?d_to - day)
        :precondition (and (at_end ?c ?d_from) (day_done ?d_from) (next_day ?d_from ?d_to))
        :effect (and (at_start ?c ?d_to) (not (at_end ?c ?d_from)))
    )

    (:action tally_frankfurt
        :parameters (?d - day ?s1 ?s2 - step)
        :precondition (and (visited frankfurt ?d) (not (tallied frankfurt ?d)) (frankfurt_count ?s1) (next_step ?s1 ?s2))
        :effect (and (not (frankfurt_count ?s1)) (frankfurt_count ?s2) (tallied frankfurt ?d))
    )

    (:action tally_bucharest
        :parameters (?d - day ?s1 ?s2 - step)
        :precondition (and (visited bucharest ?d) (not (tallied bucharest ?d)) (bucharest_count ?s1) (next_step ?s1 ?s2))
        :effect (and (not (bucharest_count ?s1)) (bucharest_count ?s2) (tallied bucharest ?d))
    )

    (:action tally_stuttgart
        :parameters (?d - day ?s1 ?s2 - step)
        :precondition (and (visited stuttgart ?d) (not (tallied stuttgart ?d)) (stuttgart_count ?s1) (next_step ?s1 ?s2))
        :effect (and (not (stuttgart_count ?s1)) (stuttgart_count ?s2) (tallied stuttgart ?d))
    )
)