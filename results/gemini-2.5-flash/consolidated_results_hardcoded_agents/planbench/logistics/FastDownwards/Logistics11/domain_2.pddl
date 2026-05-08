(define (domain logistics)
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
        (in-city ?l - location ?c - city)
        (is-airport ?l - location)

        (at ?o - (either package vehicle) ?l - location)
        (in ?p - package ?v - vehicle)
    )

    (:functions
        (total-cost) - number
    )

    ; --- Truck Actions ---

    (:action move-truck
        :parameters (?t - truck ?lfrom - location ?lto - location ?c - city)
        :precondition (and
            (at ?t ?lfrom)
            (in-city ?lfrom ?c)
            (in-city ?lto ?c)
            (not (= ?lfrom ?lto))
        )
        :effect (and
            (at ?t ?lto)
            (not (at ?t ?lfrom))
            (increase (total-cost) 1)
        )
    )

    (:action load-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?t ?l)
        )
        :effect (and
            (in ?p ?t)
            (not (at ?p ?l))
            (increase (total-cost) 1)
        )
    )

    (:action unload-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in ?p ?t)
            (at ?t ?l)
        )
        :effect (and
            (at ?p ?l)
            (not (in ?p ?t))
            (increase (total-cost) 1)
        )
    )

    ; --- Airplane Actions ---

    (:action fly-plane
        :parameters (?a - airplane ?lfrom - location ?lto - location)
        :precondition (and
            (at ?a ?lfrom)
            (is-airport ?lfrom)
            (is-airport ?lto)
            (not (= ?lfrom ?lto))
        )
        :effect (and
            (at ?a ?lto)
            (not (at ?a ?lfrom))
            (increase (total-cost) 10) ; Higher cost for air transport
        )
    )

    (:action load-plane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?a ?l)
            (is-airport ?l)
        )
        :effect (and
            (in ?p ?a)
            (not (at ?p ?l))
            (increase (total-cost) 1)
        )
    )

    (:action unload-plane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in ?p ?a)
            (at ?a ?l)
            (is-airport ?l)
        )
        :effect (and
            (at ?p ?l)
            (not (in ?p ?a))
            (increase (total-cost) 1)
        )
    )