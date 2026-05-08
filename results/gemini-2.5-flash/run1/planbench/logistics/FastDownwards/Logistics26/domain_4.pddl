(define (domain logistics26)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        city
        location
        shippable ; Common supertype for anything that can be 'at' a location
        package - shippable
        vehicle - shippable
        truck - vehicle
        airplane - vehicle
    )

    (:predicates
        (at ?obj - shippable ?loc - location)
        (in ?p - package ?v - vehicle)
        (in_city ?loc - location ?c - city)
        (is_airport ?loc - location)
    )

    (:action load_pkg_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?t ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?t)
        )
    )

    (:action unload_pkg_truck
        :parameters (?p - package ?t - truck ?l - location)
        :precondition (and
            (in ?p ?t)
            (at ?t ?l)
        )
        :effect (and
            (not (in ?p ?t))
            (at ?p ?l)
        )
    )

    (:action drive_truck
        :parameters (?t - truck ?from - location ?to - location ?c - city)
        :precondition (and
            (at ?t ?from)
            (in_city ?from ?c)
            (in_city ?to ?c)
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    (:action load_pkg_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (at ?p ?l)
            (at ?a ?l)
        )
        :effect (and
            (not (at ?p ?l))
            (in ?p ?a)
        )
    )

    (:action unload_pkg_airplane
        :parameters (?p - package ?a - airplane ?l - location)
        :precondition (and
            (in ?p ?a)
            (at ?a ?l)
        )
        :effect (and
            (not (in ?p ?a))
            (at ?p ?l)
        )
    )

    (:action fly_airplane
        :parameters (?a - airplane ?from - location ?to - location)
        :precondition (and
            (at ?a ?from)
            (is_airport ?from)
            (is_airport ?to)
        )
        :effect (and
            (not (at ?a ?from))
            (at ?a ?to)
        )
    )