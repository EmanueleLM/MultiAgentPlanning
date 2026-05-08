(define (domain logistics-domain)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        city
        location
        package
        vehicle
        truck - vehicle
        airplane - vehicle
    )

    (:predicates
        (at ?obj - (package vehicle) ?loc - location)
        (in-city ?loc - location ?city - city)
        (is-airport ?loc - location)
        (in-truck ?pkg - package ?t - truck)
        (in-airplane ?pkg - package ?a - airplane)
    )

    (:functions
        (total-cost)
    )

    ;; Truck Actions
    (:action drive-truck
        :parameters (?t - truck ?from - location ?to - location ?c - city)
        :precondition (and
            (at ?t ?from)
            (in-city ?from ?c)
            (in-city ?to ?c)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
            (increase (total-cost) 1)
        )
    )

    (:action load-truck
        :parameters (?p - package ?t - truck ?loc - location)
        :precondition (and
            (at ?p ?loc)
            (at ?t ?loc)
        )
        :effect (and
            (not (at ?p ?loc))
            (in-truck ?p ?t)
            (increase (total-cost) 1)
        )
    )

    (:action unload-truck
        :parameters (?p - package ?t - truck ?loc - location)
        :precondition (and
            (in-truck ?p ?t)
            (at ?t ?loc)
        )
        :effect (and
            (not (in-truck ?p ?t))
            (at ?p ?loc)
            (increase (total-cost) 1)
        )
    )

    ;; Airplane Actions
    (:action fly-airplane
        :parameters (?a - airplane ?from - location ?to - location)
        :precondition (and
            (at ?a ?from)
            (is-airport ?from)
            (is-airport ?to)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at ?a ?from))
            (at ?a ?to)
            (increase (total-cost) 1)
        )
    )

    (:action load-airplane
        :parameters (?p - package ?a - airplane ?loc - location)
        :precondition (and
            (at ?p ?loc)
            (at ?a ?loc)
            (is-airport ?loc)
        )
        :effect (and
            (not (at ?p ?loc))
            (in-airplane ?p ?a)
            (increase (total-cost) 1)
        )
    )

    (:action unload-airplane
        :parameters (?p - package ?a - airplane ?loc - location)
        :precondition (and
            (in-airplane ?p ?a)
            (at ?a ?loc)
            (is-airport ?loc)
        )
        :effect (and
            (not (in-airplane ?p ?a))
            (at ?p ?loc)
            (increase (total-cost) 1)
        )
    )
)