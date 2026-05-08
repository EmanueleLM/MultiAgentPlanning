(define (domain trip_planning_example_3)
    (:requirements :strips :typing :negative-preconditions)
    (:types city day)

    (:predicates
        (at ?c - city)
        (current_day ?d - day)
        (next ?d1 ?d2 - day)
        (visited ?c - city ?d - day)
        (claimed ?c - city ?d - day)
        (has_visit_1 ?c - city)
        (has_visit_2 ?c - city)
        (has_visit_3 ?c - city)
        (met_friend)
        (can_fly ?c1 ?c2 - city)
        (not_started)
        (friend_at_bucharest ?d - day)
    )

    ;; The traveler starts the trip at one of the cities on the first day.
    (:action start_trip
        :parameters (?c - city)
        :precondition (and (not_started) (current_day day_1))
        :effect (and (not (not_started)) (at ?c))
    )

    ;; Staying in a city for a whole day.
    (:action stay
        :parameters (?c - city ?d - day ?dn - day)
        :precondition (and (at ?c) (current_day ?d) (next ?d ?dn))
        :effect (and (not (current_day ?d)) (current_day ?dn) (visited ?c ?d))
    )

    ;; Flying between cities. One day counts for both cities.
    (:action fly
        :parameters (?from ?to - city ?d - day ?dn - day)
        :precondition (and (at ?from) (current_day ?d) (next ?d ?dn) (can_fly ?from ?to))
        :effect (and (not (current_day ?d)) (current_day ?dn) (not (at ?from)) (at ?to) (visited ?from ?d) (visited ?to ?d))
    )

    ;; Meeting the friend in Bucharest, possible on days specified in the problem.
    (:action meet_friend
        :parameters (?d - day)
        :precondition (and (visited bucharest ?d) (friend_at_bucharest ?d))
        :effect (met_friend)
    )

    ;; Claiming days to satisfy the visit requirements for each city.
    (:action claim_visit_1
        :parameters (?c - city ?d - day)
        :precondition (and (visited ?c ?d) (not (has_visit_1 ?c)))
        :effect (and (has_visit_1 ?c) (claimed ?c ?d))
    )

    (:action claim_visit_2
        :parameters (?c - city ?d - day)
        :precondition (and (visited ?c ?d) (not (claimed ?c ?d)) (has_visit_1 ?c) (not (has_visit_2 ?c)))
        :effect (and (has_visit_2 ?c) (claimed ?c ?d))
    )

    (:action claim_visit_3
        :parameters (?c - city ?d - day)
        :precondition (and (visited ?c ?d) (not (claimed ?c ?d)) (has_visit_2 ?c) (not (has_visit_3 ?c)))
        :effect (and (has_visit_3 ?c) (claimed ?c ?d))
    )
)