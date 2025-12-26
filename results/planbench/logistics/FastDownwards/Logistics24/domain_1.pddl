(define (domain logistics24)
    (:requirements :strips :typing :negative-preconditions)
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

        (in-truck ?p - package ?t - truck)
        (in-airplane ?p - package ?a - airplane)
    )

    ; --- Truck Actions (Intra-city) ---

    (:action drive-truck
        :parameters (?t - truck ?l-from - location ?l-to - location ?c - city)
        :precondition (and
            (at ?t ?l-from)
            (in-city ?l-from ?c)
            (in-city ?l-to ?c)
            (not (= ?l-from ?l-to))
        )
        :effect (and
            (at ?t ?l-to)
            (not (at ?t ?l-from))
        )
    )

    (:action load-package-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?t ?l)
        )
        :effect (and
            (in-truck ?p ?t)
            (not (at ?p ?l))
        )
    )

    (:action unload-package-truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in-truck ?p ?t)
            (at ?t ?l)
        )
        :effect (and
            (at ?p ?l)
            (not (in-truck ?p ?t))
        )
    )

    ; --- Airplane Actions (Inter-city) ---

    (:action fly-airplane
        :parameters (?a - airplane ?l-from - location ?l-to - location ?c-from - city ?c-to - city)
        :precondition (and
            (at ?a ?l-from)
            (is-airport ?l-from)
            (is-airport ?l-to)
            (in-city ?l-from ?c-from)
            (in-city ?l-to ?c-to)
            (not (= ?c-from ?c-to)) ; Must fly between distinct cities
        )
        :effect (and
            (at ?a ?l-to)
            (not (at ?a ?l-from))
        )
    )

    (:action load-package-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?a ?l)
        )
        :effect (and
            (in-airplane ?p ?a)
            (not (at ?p ?l))
        )
    )

    (:action unload-package-airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in-airplane ?p ?a)
            (at ?a ?l)
        )
        :effect (and
            (at ?p ?l)
            (not (in-airplane ?p ?a))
        )
    )
)