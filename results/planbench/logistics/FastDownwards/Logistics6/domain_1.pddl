(define (domain logistics-domain)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        package - object
        truck airplane - vehicle
        vehicle location city - object
    )

    (:predicates
        (at ?o - (or package vehicle) ?l - location)
        (in-city ?l - location ?c - city)
        (is-airport ?l - location)
        (in ?p - package ?v - vehicle)
    )

    (:functions
        (total-cost) - number
    )

    (:action load-truck
        :parameters (?p - package ?t - truck ?l - location ?c - city)
        :precondition (and (at ?p ?l)
                           (at ?t ?l)
                           (in-city ?l ?c)
        )
        :effect (and (not (at ?p ?l))
                     (in ?p ?t)
                     (increase (total-cost) 1)
        )
    )

    (:action unload-truck
        :parameters (?p - package ?t - truck ?l - location ?c - city)
        :precondition (and (in ?p ?t)
                           (at ?t ?l)
                           (in-city ?l ?c)
        )
        :effect (and (at ?p ?l)
                     (not (in ?p ?t))
                     (increase (total-cost) 1)
        )
    )

    (:action drive-truck
        :parameters (?t - truck ?l-from - location ?l-to - location ?c - city)
        :precondition (and (at ?t ?l-from)
                           (in-city ?l-from ?c)
                           (in-city ?l-to ?c)
                           (not (= ?l-from ?l-to))
        )
        :effect (and (not (at ?t ?l-from))
                     (at ?t ?l-to)
                     (increase (total-cost) 1)
        )
    )

    (:action load-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and (at ?p ?l)
                           (at ?a ?l)
                           (is-airport ?l)
        )
        :effect (and (not (at ?p ?l))
                     (in ?p ?a)
                     (increase (total-cost) 1)
        )
    )

    (:action unload-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and (in ?p ?a)
                           (at ?a ?l)
                           (is-airport ?l)
        )
        :effect (and (at ?p ?l)
                     (not (in ?p ?a))
                     (increase (total-cost) 1)
        )
    )

    (:action fly-airplane
        :parameters (?a - airplane ?l-from - location ?l-to - location ?c-from - city ?c-to - city)
        :precondition (and (at ?a ?l-from)
                           (is-airport ?l-from)
                           (is-airport ?l-to)
                           (in-city ?l-from ?c-from)
                           (in-city ?l-to ?c-to)
                           (not (= ?c-from ?c-to))
        )
        :effect (and (not (at ?a ?l-from))
                     (at ?a ?l-to)
                     (increase (total-cost) 1)
        )
    )
)